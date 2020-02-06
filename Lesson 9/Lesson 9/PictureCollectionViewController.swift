//
//  PictureCollectionViewController.swift
//  Lesson 9
//
//  Created by Lucas Derraugh on 1/29/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

class PictureCollectionViewController: NSViewController {

    @IBOutlet weak var collectionView: NSCollectionView!
    
    private var dataSource: NSCollectionViewDiffableDataSource<Int, URL>!
    private var imageURLs = [URL]()
    
    lazy var queue = DispatchQueue(label: "com.lucas.ImageRequestingQueue", qos: .userInitiated, attributes: [.concurrent])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(PictureCollectionViewItem.self, forItemWithIdentifier: PictureCollectionViewItem.reuseIdentifier)
        collectionView.collectionViewLayout = createLayout()
        
        setupDataSource()
    }
    
    private func createLayout() -> NSCollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .absolute(300))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)

            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

            return section
        }

        let layout = NSCollectionViewCompositionalLayout(sectionProvider: sectionProvider)
        return layout
    }
    
    private func setupDataSource() {
        let directory = URL(fileURLWithPath: "/System/Library/Desktop Pictures")
        guard let enumerator = FileManager.default.enumerator(at: directory, includingPropertiesForKeys: [.typeIdentifierKey]) else { return }
        for case let url as URL in enumerator {
            guard let type = try? url.resourceValues(forKeys: [.typeIdentifierKey]).typeIdentifier else { continue }
            let identifier = type as CFString
            if UTTypeConformsTo(identifier, kUTTypeImage) {
                imageURLs.append(url)
            }
        }
        
        dataSource = NSCollectionViewDiffableDataSource(collectionView: collectionView) { [weak self] (collectionView, indexPath, url) -> NSCollectionViewItem? in
            let collectionViewItem = collectionView.makeItem(withIdentifier: PictureCollectionViewItem.reuseIdentifier, for: indexPath)
            guard let self = self, let imageView = collectionViewItem.imageView else { return nil }
            let newTag = imageView.tag + 1
            collectionViewItem.imageView?.tag = newTag
            self.queue.async {
                let image = resizedImage(at: url, for: CGSize(width: 400, height: 300))
                DispatchQueue.main.async {
                    if newTag == imageView.tag {
                        imageView.image = image
                    }
                }
            }
            return collectionViewItem
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, URL>()

        snapshot.appendSections([0])
        snapshot.appendItems(imageURLs, toSection: 0)

        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// https://nshipster.com/image-resizing/#technique-3-creating-a-thumbnail-with-image-io
fileprivate func resizedImage(at url: URL, for size: CGSize) -> NSImage? {
    let options: [CFString: Any] = [
        kCGImageSourceCreateThumbnailFromImageIfAbsent: true,
        kCGImageSourceCreateThumbnailWithTransform: true,
        kCGImageSourceShouldCacheImmediately: true,
        kCGImageSourceThumbnailMaxPixelSize: max(size.width, size.height)
    ]

    guard let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
        let image = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options as CFDictionary)
    else {
        return nil
    }

    return NSImage(cgImage: image, size: size)
}


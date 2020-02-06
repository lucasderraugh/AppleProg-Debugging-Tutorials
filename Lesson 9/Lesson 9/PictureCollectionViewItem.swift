//
//  PictureCollectionViewItem.swift
//  Lesson 9
//
//  Created by Lucas Derraugh on 1/29/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

final class PictureCollectionViewItem: NSCollectionViewItem {
    
    static let reuseIdentifier = NSUserInterfaceItemIdentifier("SystemIconCollectionViewItemIdentifier")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView?.image = nil
    }
    
}

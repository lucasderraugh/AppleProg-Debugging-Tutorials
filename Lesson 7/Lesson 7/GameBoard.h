//
//  GameBoard.h
//  Lesson 1
//
//  Created by Lucas Derraugh on 9/5/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

#ifndef GameBoard_h
#define GameBoard_h

#include <stdio.h>

typedef struct {
    int p1Score;
    int p2Score;
} GameBoard;

const GameBoard * _Nonnull GameBoardCreate(int p1Score, int p2Score);

#endif /* GameBoard_h */

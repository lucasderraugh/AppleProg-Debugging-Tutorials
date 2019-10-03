//
//  GameBoard.c
//  Lesson 1
//
//  Created by Lucas Derraugh on 9/5/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

#include "GameBoard.h"

const GameBoard * GameBoardCreate(int p1Score, int p2Score) {
    GameBoard g = {
        .p1Score = p1Score,
        .p2Score = p2Score
    };
    return &g;
}

//
//  Shape.swift
//  Rock Paper Scissors
//
//  Created by Mike on 5/30/19.
//  Copyright © 2019 William Nau. All rights reserved.
//

import GameplayKit

let randomShape = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func getOpponentsPlay() -> Shape {
    return randomShape.nextInt() == 0 ? .rock : randomShape.nextInt() == 1 ? .paper : .scissors
}

enum Shape {
    case rock, paper, scissors
    
    func result(_ opponent: Shape) -> GameState {
        if self == opponent {
            return .draw
        } else if self == .rock && opponent == .paper ||
                  self == .paper && opponent == .scissors ||
                  self == .scissors && opponent == .rock {
            return .lose
        } else {
            return .win
        }
    }
}

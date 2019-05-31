//
//  GameState.swift
//  Rock Paper Scissors
//
//  Created by Mike on 5/30/19.
//  Copyright © 2019 William Nau. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    func status() -> String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors"
        case .win:
            return "Congrats, YOU WIN!"
        case .lose:
            return "Sorry, you lost."
        case .draw:
            return "It's a draw"
        }
    }
}

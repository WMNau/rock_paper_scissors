//
//  GameVC.swift
//  Rock Paper Scissors
//
//  Created by Mike on 5/30/19.
//  Copyright © 2019 William Nau. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    @IBOutlet weak var opponentLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    let opponent = "🤖"
    let rock = "👊"
    let paper = "🤚"
    let scissors = "✌️"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    @IBAction func shapeSelected(_ sender: UIButton) {
        let tag = sender.tag
        play(tag == 1 ? .rock : tag == 2 ? .paper : .scissors)
    }

    @IBAction func playAgainSelected(_ sender: Any) {
        reset()
    }
}

extension GameVC {
    fileprivate func reset() {
        setOpponentLabel(opponent)
        setStatus(.start)
        disableShapes(nil)
    }
    
    fileprivate func play(_ shape: Shape) {
        let opponent = getOpponentsPlay()
        setOpponentLabel(getLabelText(opponent))
        disableShapes(shape)
        setStatus(shape.result(opponent))
    }
    
    fileprivate func disableShapes(_ shape: Shape?) {
        rockButton.isEnabled = shape == nil
        rockButton.alpha = shape == nil || shape == .rock ? 1.0 : 0.0
        paperButton.isEnabled = shape == nil
        paperButton.alpha = shape == nil || shape == .paper ? 1.0 : 0.0
        scissorsButton.isEnabled = shape == nil
        scissorsButton.alpha = shape == nil || shape == .scissors ? 1.0 : 0.0
        playAgainButton.isHidden = shape == nil
    }
    
    fileprivate func getLabelText(_ shape: Shape) -> String {
        switch shape {
        case .rock:
            return rock
        case .paper:
            return paper
        case .scissors:
            return scissors
        }
    }
    
    fileprivate func setOpponentLabel(_ txt: String) {
        opponentLabel.text = txt
    }
    
    fileprivate func setStatus(_ state: GameState) {
        statusLabel.text = state.status()
    }
}


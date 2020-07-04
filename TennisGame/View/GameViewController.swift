//
//  ViewController.swift
//  TennisGame
//
//  Created by Karthik Ravikumar on 01/07/20.
//  Copyright © 2020 Karthik Ravikumar. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var presenter: GamePresenter!
    @IBOutlet weak var scoreMessage: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    @IBOutlet weak var playerOneScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playerOneAction(_ sender: UIButton) {
        presenter.game.playerPlays(selectedPlayer: .PlayerOne)
        updateScores()
    }
    
    @IBAction func playerTwoAction(_ sender: UIButton) {
        presenter.game.playerPlays(selectedPlayer: .PlayerTwo)
        updateScores()
    }
    
    func updateScores() {
        _ = presenter.playerOneScore()
        _ = presenter.playerTwoScore()
        _ = presenter.displayScore()
    }
    
}

extension GameViewController: GameView {
    
    func playerOneScore(playerOneScore: String) {
        self.playerOneScore.text = playerOneScore
    }
    
    func playerTwoScore(playerTwoScore: String) {
        self.playerTwoScore.text = playerTwoScore
    }
    
    func display(scoreMessage: String) {
        self.scoreMessage.text = scoreMessage
    }
    
}

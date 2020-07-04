//
//  GamePresenter.swift
//  TennisGame
//
//  Created by Karthik Ravikumar on 02/07/20.
//  Copyright © 2020 Karthik Ravikumar. All rights reserved.
//

import Foundation

class GamePresenter {
    private weak var view: GameView?
    let playerOne: Player
    let playerTwo: Player
    let game: Game
    
    init(view: GameView)  {
        self.view = view
        playerOne = Player(playerName: "Player 1")
        playerTwo = Player(playerName: "Player 2")
        game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
    }
    
    func playerOneScore() -> String {
        view?.playerOneScore(playerOneScore: game.playerScore(selectedPlayer: .PlayerOne))
        return game.playerScore(selectedPlayer: .PlayerOne)
    }
    
    func playerTwoScore() -> String {
        view?.playerTwoScore(playerTwoScore: game.playerScore(selectedPlayer: .PlayerTwo))
        return game.playerScore(selectedPlayer: .PlayerTwo)
    }
    
    func displayScore() -> String {
        view?.display(scoreMessage: game.score())
        return game.score()
    }
    
}


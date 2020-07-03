//
//  Game.swift
//  TennisGame
//
//  Created by Karthik Ravikumar on 02/07/20.
//  Copyright © 2020 Karthik Ravikumar. All rights reserved.
//

import Foundation

enum SelectedPlayer {
    case PlayerOne
    case PlayerTwo
}


class Game {
    let playerOne: Player
    let playerTwo: Player
    
    init(firstPlayer: Player, secondPlayer: Player) {
        playerOne = firstPlayer
        playerTwo = secondPlayer
    }
    
    //MARK: - Player Action
    
    func playerPlays(selectedPlayer:SelectedPlayer) {
        switch selectedPlayer {
        case .PlayerOne:
            self.playerOne.play()
        case .PlayerTwo:
            self.playerTwo.play()
        }
        
    }
    
    //MARK: - Display scores at end of each serve
    
    func score() -> String {
        
        let playerOneScore = "\(self.playerOne.name) \(pointsToWordTranslation(scores:self.playerOne.score)) - "
        let playerTwoScore = "\(self.playerTwo.name) \(pointsToWordTranslation(scores:self.playerTwo.score))"
        return playerOneScore + playerTwoScore
    }
    
    //MARK: - Convert scores to word
    
    func pointsToWordTranslation(scores:Int) -> String {
        switch scores {
        case 0:
            return "love"
        case 1:
            return "fifteen"
        case 2:
            return "thirty"
        default:
            return ""
            
        }
        
    }
    
    //MARK: - Convert scores to Actual game values
    
    func scoreNumericWordTranslation(score:Int) -> String {
        
        switch score {
        case 0:
            return String(score)
        case 1:
            return "15"
        case 2:
            return "30"
        default:
            return ""
        }
        
    }
    
}

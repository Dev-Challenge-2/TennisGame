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
    
    //MARK: - Display Player scores
    
    func playerScore(selectedPlayer: SelectedPlayer) -> String {
        
        switch selectedPlayer {
        case .PlayerOne:
            return scoreNumericWordTranslation(score: playerOne.score, opponentScore: playerTwo.score)
        case .PlayerTwo:
            return scoreNumericWordTranslation(score: playerTwo.score, opponentScore: playerOne.score)
        }
    }
    
    //MARK: - Display Game score
    
    func score() -> String {
        
        if isDeuce() {
            return "Deuce"
        }else if hasAdvantage() {
            return playerWithHighestScore() + " Advantage"
        } else {
            let playerOneScore = "\(playerOne.name) \(pointsToWordTranslation(scores:playerOne.score)) - "
            let playerTwoScore = "\(playerTwo.name) \(pointsToWordTranslation(scores:playerTwo.score))"
            return playerOneScore + playerTwoScore
        }
    }
    
    //MARK: - Convert scores to Actual game values
    
    func scoreNumericWordTranslation(score:Int, opponentScore: Int) -> String {
        
        if(score >= 4 && score == opponentScore + 1 ) {
            return "AD"
        }
        
        switch score {
        case 0:
            return String(score)
        case 1:
            return "15"
        case 2:
            return "30"
        case 3:
            return "40"
        default:
            return ""
        }
    }
    
    //MARK: - Private Methods
    
    private func isDeuce() -> Bool {
        return playerOne.score >= 3 && playerTwo.score == playerOne.score
    }
    
    private func hasAdvantage() -> Bool {
        if playerOne.score >= 4 && playerOne.score == playerTwo.score + 1 {
            return true
        }else if playerTwo.score >= 4 && playerTwo.score == playerOne.score + 1 {
            return true
        }else {
            return false
        }
    }
    
    private func playerWithHighestScore() -> String {
        if (playerOne.score > playerTwo.score) {
            return playerOne.name;
        } else {
            return playerTwo.name;
        }
    }

    private func pointsToWordTranslation(scores:Int) -> String {
        
        switch scores {
        case 0:
            return "love"
        case 1:
            return "fifteen"
        case 2:
            return "thirty"
        case 3:
            return "forty"
        default:
            return "0"
            
        }
    }
}

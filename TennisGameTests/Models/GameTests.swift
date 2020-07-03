//
//  GameTests.swift
//  TennisGameTests
//
//  Created by Karthik Ravikumar on 02/07/20.
//  Copyright © 2020 Karthik Ravikumar. All rights reserved.
//

import XCTest
@testable import TennisGame

class GameTests: XCTestCase {

    var playerOne: Player!
    var playerTwo: Player!
    var game: Game!
    
    override func setUpWithError() throws {
        playerOne = Player(playerName: "Player 1")
        playerTwo = Player(playerName: "Player 2")
        game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
    }

    override func tearDownWithError() throws {
        playerOne = nil
        playerTwo = nil
        game = nil
    }
    
    //MARK: - Player One First serve
    
    func testGame_PlayerOneScoresFifteen_ShouldReturnPlayerOneScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        //Act
        let sut = game.scoreNumericWordTranslation(score: playerOne.score)
        //Assert
        XCTAssertTrue(sut == "15","Player 1 expected to score 15")
    }
    
    func testGame_PlayerTwoScoresZero_ShouldReturnPlayerTwoScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        //Act
        let sut = game.scoreNumericWordTranslation(score: playerTwo.score)
        //Assert
        XCTAssertTrue(sut == "0","Player 2 score will be love")

    }

    func testGame_GameScoreAfterPlayerOneWins15_ShouldReturnScore(){
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        //Act
        let sut = game.score()
        //Arrange
        XCTAssertTrue(sut == "Player 1 fifteen - Player 2 love", "Should return player 1 15 and player two love")

    }
    
}

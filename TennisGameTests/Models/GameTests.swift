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
    
    //MARK: - Test cases for score 15 - 0
    
    func testGame_PlayerOneScoresFifteen_ShouldReturnPlayerOneScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        //Act
        let sut = game.playerScore(selectedPlayer: .PlayerOne)
        //Assert
        XCTAssertTrue(sut == "15","Player 1 expected to score 15")
    }
    
    func testGame_PlayerTwoScoresZeroWhenPlayerOneScoresFifteen_ShouldReturnPlayerTwoScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        //Act
        let sut = game.playerScore(selectedPlayer: .PlayerTwo)
        //Assert
        XCTAssertTrue(sut == "0","Player 2 score will be love")

    }

    func testGame_GameScoreAfterPlayerOneWinsFifteen_ShouldReturnScore(){
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        //Act
        let sut = game.score()
        //Arrange
        XCTAssertTrue(sut == "Player 1 fifteen - Player 2 love", "Should return player 1 fifteen and player two love")

    }

    //MARK: - Test cases for score 30 - 0

    func testGame_PlayerOneScoresThirty_ShouldReturnPlayerOneScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerOne)
        //Act
        let sut = game.playerScore(selectedPlayer: .PlayerOne)
        //Assert
        XCTAssertTrue(sut == "30","Player 1 expected to score 30")
    }

    func testGame_PlayerTwoScoresZeroWhenPlayerOneScoresThirty_ShouldReturnPlayerTwoScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerOne)
        //Act
        let sut = game.playerScore(selectedPlayer: .PlayerTwo)
        //Assert
        XCTAssertTrue(sut == "0","Player 2 score should be love")
    }

    func testGame_GameScoreAfterPlayerOneWinsThirty_ShouldReturnScore(){
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerOne)
        //Act
        let sut = game.score()
        //Arrange
        XCTAssertTrue(sut == "Player 1 thirty - Player 2 love", "Should return player 1 thirty and player two love")
    }

    //MARK: - Test cases for score 40 - 0

    func testGame_PlayerOneScoresForty_ShouldReturnPlayerOneScore() {
         //Arrange
         game.playerPlays(selectedPlayer: .PlayerOne)
         game.playerPlays(selectedPlayer: .PlayerOne)
         game.playerPlays(selectedPlayer: .PlayerOne)
         //Act
         let sut = game.playerScore(selectedPlayer: .PlayerOne)
         //Assert
         XCTAssertTrue(sut == "40","Player 1 expected to score 40")
     }

    func testGame_PlayerTwoScoresZeroWhenPlayerOneScoresForty_ShouldReturnPlayerTwoScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerOne)
        //Act
        let sut = game.playerScore(selectedPlayer: .PlayerTwo)
        //Assert
        XCTAssertTrue(sut == "0","Player 2 score should be love")
    }

    func testGame_GameScoreAfterPlayerOneWinsForty_ShouldReturnScore(){
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerOne)
        //Act
        let sut = game.score()
        //Arrange
        XCTAssertTrue(sut == "Player 1 forty - Player 2 love", "Should return player 1 forty and player two love")
    }

    //MARK: - Test cases for score 0 - 15

    func testGame_PlayerTwoScoresFifteen_ShouldReturnPlayerTwoScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
        let sut = game.playerScore(selectedPlayer: .PlayerTwo)
        //Assert
        XCTAssertTrue(sut == "15","Player 2 expected to score 15")
    }

    func testGame_PlayerOneScoresZeroWhenPlayerTwoScoresFifteen_ShouldReturnPlayerOneScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
        let sut = game.playerScore(selectedPlayer: .PlayerOne)
        //Assert
        XCTAssertTrue(sut == "0","Player 1 score will be love")

    }

    func testGame_GameScoreAfterPlayerTwoWinsFifteen_ShouldReturnScore(){
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
        let sut = game.score()
        //Arrange
        XCTAssertTrue(sut == "Player 1 love - Player 2 fifteen", "Should return player 1 love and player two fifteen")

    }

    //MARK: - Test cases for score 0 - 30

    func testGame_PlayerTwoScoresThirty_ShouldReturnPlayerTwoScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
        let sut = game.playerScore(selectedPlayer: .PlayerTwo)
        //Assert
        XCTAssertTrue(sut == "30","Player 2 expected to score 30")
    }

    func testGame_PlayerOneScoresZeroWhenPlayerTwoScoresThirty_ShouldReturnPlayerOneScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
        let sut = game.playerScore(selectedPlayer: .PlayerOne)
        //Assert
        XCTAssertTrue(sut == "0","Player 1 score should be love")
    }

    func testGame_GameScoreAfterPlayerTwoWinsThirty_ShouldReturnScore(){
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
        let sut = game.score()
        //Arrange
        XCTAssertTrue(sut == "Player 1 love - Player 2 thirty", "Should return player 1 love and player two thirty")
    }

    //MARK: - Test cases for score 0 - 40

    func testGame_PlayerTwoScoresForty_ShouldReturnPlayerTwoScore() {
         //Arrange
         game.playerPlays(selectedPlayer: .PlayerTwo)
         game.playerPlays(selectedPlayer: .PlayerTwo)
         game.playerPlays(selectedPlayer: .PlayerTwo)
         //Act
         let sut = game.playerScore(selectedPlayer: .PlayerTwo)
         //Assert
         XCTAssertTrue(sut == "40","Player 2 expected to score 40")
     }

    func testGame_PlayerOneScoresZeroWhenPlayerTwoScoresForty_ShouldReturnPlayerOneScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
        let sut = game.playerScore(selectedPlayer: .PlayerOne)
        //Assert
        XCTAssertTrue(sut == "0","Player 2 score should be love")
    }

    func testGame_GameScoreAfterPlayerTwoWinsForty_ShouldReturnScore(){
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
        let sut = game.score()
        //Assert
        XCTAssertTrue(sut == "Player 1 love - Player 2 forty", "Should return player 1 love and player two forty")
    }

    //MARK: - Test cases for score 15 - 15

    func testGame_PlayerOneScoresFifteenAndPlayerTwoScoresFifteen_ShoudReturnScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
        let sut = game.score()
        //Assert
        XCTAssertTrue(sut == "Player 1 fifteen - Player 2 fifteen", "Should return player 1 fifteen and player two fifteen")
    }

    //MARK: - Test cases for score 30 - 30

    func testGame_PlayerOneScoresThirtyAndPlayerTwoScoresThirty_ShoudReturnScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
        let sut = game.score()
        //Assert
        XCTAssertTrue(sut == "Player 1 thirty - Player 2 thirty", "Should return player 1 fifteen and player two fifteen")
    }
    
    //MARK: - Test cases for Deuce

    func testGame_DeuceScoreForPlayerOne_ShouldReturnScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)

        //Act
        let sut = game.playerScore(selectedPlayer: .PlayerOne)
        //Assert
        XCTAssertTrue(sut == "40", "Player 1 score for Deuce")
    }

    func testGame_DeuceScoreForPlayerTwo_ShouldReturnScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
        let sut = game.playerScore(selectedPlayer: .PlayerTwo)
        //Assert
        XCTAssertTrue(sut == "40", "Player 2 score for Deuce")
    }

     func testGame_GameScoreAfterDeuce_ShouldReturnScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
        let sut = game.score()
        //Assert
        XCTAssertTrue(sut == "Deuce", "Should display score for Deuce")

    }

    //MARK: - Test cases for Player 1 Advantage

    func testGame_AdvantageForPlayerOne_ShouldReturnScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        //Act
       let sut = game.playerScore(selectedPlayer: .PlayerOne)
        //Assert
        XCTAssertTrue(sut == "AD", "Should display score for Player 1 advantage")
    }
    
    func testGame_GameScorePlayerOneAdvantage_ShouldReturnScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        //Act
        let sut = game.score()
        //Assert
        XCTAssertTrue(sut == "Player 1 Advantage", "Should display score for Player 1 advantage")
    }
    
    //MARK: - Test cases for Player 2 Advantage

    func testGame_AdvantageForPlayerTwo_ShouldReturnScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
       let sut = game.playerScore(selectedPlayer: .PlayerTwo)
        //Assert
        XCTAssertTrue(sut == "AD", "Should display score for Player 2 advantage")
    }
    
    func testGame_GameScorePlayerTwoAdvantage_ShouldReturnScore() {
        //Arrange
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerOne)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        game.playerPlays(selectedPlayer: .PlayerTwo)
        //Act
        let sut = game.score()
        //Assert
        XCTAssertTrue(sut == "Player 2 Advantage", "Should display score for Player 2 advantage")
    }


}

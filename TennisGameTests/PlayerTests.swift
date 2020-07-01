//
//  Player.swift
//  TennisGameTests
//
//  Created by Karthik Ravikumar on 01/07/20.
//  Copyright © 2020 Karthik Ravikumar. All rights reserved.
//

import XCTest
@testable import TennisGame

class PlayerTests: XCTestCase {
    
    func testPlayer_InitialState_ShouldReturnZero() {
        //Arrange
        let sut = Player(playerName: "Player 1")
        //Act
        let initialScore = sut.score
        //Assert
        XCTAssertTrue(initialScore == 0,"Initial score of Player is zero")
    }
    
    func testPlayer_PlayerStartsGame_ShouldUpdateScore() {
        //Arrange
        let sut = Player(playerName: "Player 1")
        //Act
        sut.play()
        //Arrange
        XCTAssertTrue(sut.score == 1,"Player score update when game starts")
    }
}

import XCTest
@testable import TennisGame

class PlayerTests: XCTestCase {
    
    //MARK: - Test case to initialise score and players
    
    func testPlayer_InitialState_ShouldReturnZero() {
        //Arrange
        let player = Player(playerName: "Player 1")
        //Act
        let initialScore = player.score
        //Assert
        XCTAssertTrue(initialScore == 0,"Initial score of Player is zero")
    }
    
    //MARK: - Test case for score update
    
    func testPlayer_PlayerStartsGame_ShouldUpdateScore() {
        //Arrange
        let player = Player(playerName: "Player 1")
        //Act
        player.play()
        //Arrange
        XCTAssertTrue(player.score == 1,"Player score update when game starts")
    }
    
    //MARK: - Test case for score clear
    
    func testPlayer_WinsGame_ShouldResetScore() {
        //Arrange
        let player = Player(playerName: "Player 1")
        //Act
        player.clearScore()
        //Arrange
        XCTAssertTrue(player.score == 0,"Player score clear score when a player wins")

    }

    
}

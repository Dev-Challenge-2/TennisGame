import XCTest
@testable import TennisGame

class GameTests: XCTestCase {

    var playerOne: Player!
    var playerTwo: Player!
    var game: Game!
    
    override func setUp() {
        super.setUp()
        playerOne = Player(playerName: "Player 1")
        playerTwo = Player(playerName: "Player 2")
        game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
    }

    override func tearDown() {
        super.tearDown()
        playerOne = nil
        playerTwo = nil
        game = nil
    }
    
    private func playerServe(player: SelectedPlayer, times: Int){
        for _ in 1...times {
            game.playerPlays(selectedPlayer: player)
        }
    }
    
    //MARK: - Test cases for score 15 - 0
    
    func testGame_GameScoreAfterPlayerOneWinsFifteen_ShouldReturnScore(){
        //Arrange
        playerServe(player: .playerOne, times: 1)
        //Act
        let gameScore = game.score()
        //Arrange
        XCTAssertTrue(gameScore == "Player 1 fifteen - Player 2 love", "Should return player 1 fifteen and player two love")

    }

    //MARK: - Test cases for score 30 - 0

    func testGame_GameScoreAfterPlayerOneWinsThirty_ShouldReturnScore(){
        //Arrange
        playerServe(player: .playerOne, times: 2)
        //Act
        let gameScore = game.score()
        //Arrange
        XCTAssertTrue(gameScore == "Player 1 thirty - Player 2 love", "Should return player 1 thirty and player two love")
    }

    //MARK: - Test cases for score 40 - 0

    func testGame_GameScoreAfterPlayerOneWinsForty_ShouldReturnScore(){
        //Arrange
        playerServe(player: .playerOne, times: 3)
        //Act
        let gameScore = game.score()
        //Arrange
        XCTAssertTrue(gameScore == "Player 1 forty - Player 2 love", "Should return player 1 forty and player two love")
    }

    //MARK: - Test cases for score 0 - 15

    func testGame_GameScoreAfterPlayerTwoWinsFifteen_ShouldReturnScore(){
        //Arrange
        playerServe(player: .playerTwo, times: 1)
        //Act
        let gameScore = game.score()
        //Arrange
        XCTAssertTrue(gameScore == "Player 1 love - Player 2 fifteen", "Should return player 1 love and player two fifteen")

    }

    //MARK: - Test cases for score 0 - 30

    func testGame_GameScoreAfterPlayerTwoWinsThirty_ShouldReturnScore(){
        //Arrange
        playerServe(player: .playerTwo, times: 2)
        //Act
        let gameScore = game.score()
        //Arrange
        XCTAssertTrue(gameScore == "Player 1 love - Player 2 thirty", "Should return player 1 love and player two thirty")
    }

    //MARK: - Test cases for score 0 - 40

    func testGame_GameScoreAfterPlayerTwoWinsForty_ShouldReturnScore(){
        //Arrange
        playerServe(player: .playerTwo, times: 3)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == "Player 1 love - Player 2 forty", "Should return player 1 love and player two forty")
    }

    //MARK: - Test cases for score 15 - 15

    func testGame_PlayerOneScoresFifteenAndPlayerTwoScoresFifteen_ShoudReturnScore() {
        //Arrange
        playerServe(player: .playerOne, times: 1)
        playerServe(player: .playerTwo, times: 1)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == "Player 1 fifteen - Player 2 fifteen", "Should return player 1 fifteen and player two fifteen")
    }
    
    func testGame_PlayerScoresFifteenAll_ShouldReturnPlayerTwoScore() {
        //Arrange
        playerServe(player: .playerOne, times: 1)
        playerServe(player: .playerTwo, times: 1)
        //Act
        let playerScore = game.playerScore(selectedPlayer: .playerTwo)
        //Assert
        XCTAssertTrue(playerScore == "15","Player 2 expected to score 15")
    }

    //MARK: - Test cases for score 30 - 30

    func testGame_PlayerOneScoresThirtyAndPlayerTwoScoresThirty_ShoudReturnScore() {
        //Arrange
        playerServe(player: .playerOne, times: 2)
        playerServe(player: .playerTwo, times: 2)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == "Player 1 thirty - Player 2 thirty", "Should return player 1 fifteen and player two fifteen")
    }
    
    func testGame_PlayerScoresThirtyAll_ShouldReturnPlayerTwoScore() {
        //Arrange
        playerServe(player: .playerOne, times: 2)
        playerServe(player: .playerTwo, times: 2)
        //Act
        let playerScore = game.playerScore(selectedPlayer: .playerOne)
        //Assert
        XCTAssertTrue(playerScore == "30","Player 1 expected to score 30")
    }

    
    //MARK: - Test cases for Deuce

     func testGame_GameScoreAfterDeuce_ShouldReturnScore() {
        //Arrange
        playerServe(player: .playerOne, times: 3)
        playerServe(player: .playerTwo, times: 3)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == "Deuce", "Should display score for Deuce")

    }

    //MARK: - Test cases for Player 1 Advantage
    
    func testGame_GameScorePlayerOneAdvantage_ShouldReturnScore() {
        //Arrange
        playerServe(player: .playerOne, times: 4)
        playerServe(player: .playerTwo, times: 3)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == "Player 1 Advantage", "Should display score for Player 1 advantage")
    }
    
    //MARK: - Test cases for Player 2 Advantage
    
    func testGame_GameScorePlayerTwoAdvantage_ShouldReturnScore() {
        //Arrange
        playerServe(player: .playerOne, times: 3)
        playerServe(player: .playerTwo, times: 4)
        //Act
        let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == "Player 2 Advantage", "Should display score for Player 2 advantage")
    }
    
    func testGame_AdvantageForPlayers_ShouldReturnScore() {
        //Arrange
        playerServe(player: .playerOne, times: 3)
        playerServe(player: .playerTwo, times: 4)
        //Act
       let playerScore = game.playerScore(selectedPlayer: .playerTwo)
        //Assert
        XCTAssertTrue(playerScore == "AD", "Should display AD for Player 2 advantage")
    }


    //MARK: - Test cases for Advantage Breaker
    
    func testGame_AdvantageBreaker_ShouldReturnScore() {
        //Arrange
        playerServe(player: .playerOne, times: 4)
        playerServe(player: .playerTwo, times: 4)
        //Act
       let gameScore = game.score()
        //Assert
        XCTAssertTrue(gameScore == "Deuce", "Player score returns to Deuce")
    }
    
    func testGame_AdvantageBreakerScoreForPlayers_ShouldReturnScore() {
        //Arrange
        playerServe(player: .playerOne, times: 4)
        playerServe(player: .playerTwo, times: 4)
        //Act
       let playerScore = game.playerScore(selectedPlayer: .playerOne)
        //Assert
        XCTAssertTrue(playerScore == "40", "Player 1 score for Deuce")
    }


    //MARK: - Test cases for Player 1 Wins
    
    func testGame_PlayerOneWins_ShoudReturnScore() {
        //Arrange
         playerServe(player: .playerOne, times: 4)
         playerServe(player: .playerTwo, times: 2)
         //Act
         let gameScore = game.score()
         //Assert
         XCTAssertTrue(gameScore == "Player 1 wins", "Should return player 1 wins")
    }
    
    func testGame_PlayerOneScorePlayerOneWins_ShouldResetScore() {
        //Arrange
        playerServe(player: .playerOne, times: 4)
        playerServe(player: .playerTwo, times: 2)
        //Act
        let playerOneScore = game.playerScore(selectedPlayer: .playerOne)
        //Assert
        XCTAssertTrue(playerOneScore == "1", "Should reset Player 1 score")

    }
    
    func testGame_PlayerTwoScorePlayerOneWins_ShouldResetScore() {
        //Arrange
         playerServe(player: .playerOne, times: 4)
         playerServe(player: .playerTwo, times: 2)
         //Act
         let playerTwoScore = game.playerScore(selectedPlayer: .playerTwo)
         //Assert
         XCTAssertTrue(playerTwoScore == "0", "Should reset Player 2 score")
    }    
    
    //MARK: - Test cases for Player 2 Wins
    
    func testGame_PlayerTwoWins_ShoudReturnScore() {
        //Arrange
         playerServe(player: .playerOne, times: 2)
         playerServe(player: .playerTwo, times: 4)
         //Act
         let gameScore = game.score()
         //Assert
         XCTAssertTrue(gameScore == "Player 2 wins", "Should return player 2 wins")
    }
    
    func testGame_PlayerTwoScorePlayerTwoWins_ShouldResetScore() {
        //Arrange
        playerServe(player: .playerOne, times: 2)
        playerServe(player: .playerTwo, times: 4)
        //Act
        let playerTwoScore = game.playerScore(selectedPlayer: .playerTwo)
        //Assert
        XCTAssertTrue(playerTwoScore == "1", "Should reset Player 2 score")

    }

    func testGame_PlayerOneScorePlayerTwoWins_ShouldResetScore() {
        //Arrange
         playerServe(player: .playerOne, times: 2)
         playerServe(player: .playerTwo, times: 4)
         //Act
         let playerOneScore = game.playerScore(selectedPlayer: .playerOne)
         //Assert
         XCTAssertTrue(playerOneScore == "0", "Should reset Player 1 score")
    }

}

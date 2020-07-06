@testable import TennisGame

class GameViewMock: GameView {
    
    var playerOneScore: String?
    var playerTwoScore: String?
    var gameScore: String?
    
    func display(scoreMessage: String) {
        gameScore = scoreMessage
    }
    
    func playerOneScore(playerOneScore: String) {
        self.playerOneScore = playerOneScore
    }
    
    func playerTwoScore(playerTwoScore: String) {
        self.playerTwoScore = playerTwoScore
    }
    
    
}

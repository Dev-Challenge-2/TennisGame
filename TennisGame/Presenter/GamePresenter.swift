import Foundation

class GamePresenter {
    private weak var view: GameView?
    let playerOne: Player
    let playerTwo: Player
    let game: Game
    
    init(view: GameView?)  {
        self.view = view
        playerOne = Player(playerName: "Player 1")
        playerTwo = Player(playerName: "Player 2")
        game = Game(firstPlayer: playerOne, secondPlayer: playerTwo)
    }
    
    func playerOneScore() {
        view?.playerOneScore(playerOneScore: game.playerScore(selectedPlayer: .playerOne))
    }
    
    func playerTwoScore() {
        view?.playerTwoScore(playerTwoScore: game.playerScore(selectedPlayer: .playerTwo))
    }
    
    func displayScore() {
        view?.display(scoreMessage: game.score())
    }
    
    func resetScore() {
        playerOne.clearScore()
        playerTwo.clearScore()
        view?.playerOneScore(playerOneScore: "0")
        view?.playerTwoScore(playerTwoScore: "0")
        view?.display(scoreMessage: "Love All")
    }
    
}


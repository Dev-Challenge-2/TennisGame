enum SelectedPlayer {
    case playerOne
    case playerTwo
}

enum ScoreTranslation: Int, CustomStringConvertible {
    
    case love = 0, fifteen = 15, thirty = 30, forty = 40
    
    var description: String {
        get {
            switch self {
            case .love:
                return "love"
            case .fifteen:
                return "fifteen"
            case .thirty:
                return "thirty"
            case .forty:
                return "forty"
            }
        }
    }
}

final class Game {
    private let playerOne: Player
    private let playerTwo: Player
    
    init(firstPlayer: Player, secondPlayer: Player) {
        playerOne = firstPlayer
        playerTwo = secondPlayer
    }
    
    //MARK: - Player Action
    
    func playerPlays(selectedPlayer:SelectedPlayer) {
        switch selectedPlayer {
        case .playerOne:
            self.playerOne.play()
        case .playerTwo:
            self.playerTwo.play()
        }
    }
    
    //MARK: - Display Player scores
    
    func playerScore(selectedPlayer: SelectedPlayer) -> String {
        
        switch selectedPlayer {
        case .playerOne:
            return scoreNumericWordTranslation(score: playerOne.score, opponentScore: playerTwo.score)
        case .playerTwo:
            return scoreNumericWordTranslation(score: playerTwo.score, opponentScore: playerOne.score)
        }
    }
    
    //MARK: - Display Game score
    
    func score() -> String {
        
        if isDeuce() {
            return "Deuce"
        } else if hasAdvantage() {
            return playerWithHighestScore() + " Advantage"
        } else if hasWinner() {
            return playerWithHighestScore() + " wins"
        }
        
        let playerOneScore = "\(playerOne.name) \(pointsToWordTranslation(scores:playerOne.score)) - "
        let playerTwoScore = "\(playerTwo.name) \(pointsToWordTranslation(scores:playerTwo.score))"
        return playerOneScore + playerTwoScore
        
    }
    
    //MARK: - Convert scores to Actual game values
    
    private func scoreNumericWordTranslation(score:Int, opponentScore: Int) -> String {
        
        if((score >= 4 && score == opponentScore) || (opponentScore >= 4 && opponentScore == score + 1)) {
            return "40"
        }

        if(score >= 4 && score == opponentScore + 1 ) {
            return "AD"
        }

        if(score >= 4 && score >= opponentScore + 2 ) {
            return "1"
        }

        if(opponentScore >= 4 && opponentScore >= score + 2) {
            return "0"
        }

        return playerScore(score: score)
        
    }
    
    //MARK: - Private Methods
    
    private func playerScore(score:Int) -> String {
        
        switch score {
        case 0:
            return String(ScoreTranslation.love.rawValue)
        case 1:
            return String(ScoreTranslation.fifteen.rawValue)
        case 2:
            return String(ScoreTranslation.thirty.rawValue)
        default:
            return String(ScoreTranslation.forty.rawValue)
        }
    }
    
    private func isDeuce() -> Bool {
        return playerOne.score >= 3 && playerTwo.score == playerOne.score
    }
    
    private func hasAdvantage() -> Bool {
        if playerOne.score >= 4 && playerOne.score == playerTwo.score + 1 {
            return true
        }else if playerTwo.score >= 4 && playerTwo.score == playerOne.score + 1 {
            return true
        }
            return false
        
    }
    
    private func playerWithHighestScore() -> String {
        if (playerOne.score > playerTwo.score) {
            return playerOne.name;
        }
            return playerTwo.name;
        
    }

    private func hasWinner() -> Bool {
        if(playerOne.score >= 4 && playerOne.score >= playerTwo.score + 2 ) {
            return true
        }else if (playerTwo.score >= 4 && playerTwo.score  >= playerOne.score + 2) {
            return true
        }
            return false
        
    }

    private func pointsToWordTranslation(scores:Int) -> String {

        switch scores {
        case 0:
            return String(ScoreTranslation.love.description)
        case 1:
            return ScoreTranslation.fifteen.description
        case 2:
            return ScoreTranslation.thirty.description
        default:
            return ScoreTranslation.forty.description
        }
    }
}

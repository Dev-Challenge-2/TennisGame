final class Player {
    
   private(set) var name: String
   private(set) var score: Int
    
    init(playerName:String) {
        self.name = playerName
        self.score = 0
    }
    
    func play() {
        score += 1
    }
    
    func clearScore() {
        score = 0
    }
}

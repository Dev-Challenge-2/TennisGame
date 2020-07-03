//
//  Player.swift
//  TennisGame
//
//  Created by Karthik Ravikumar on 01/07/20.
//  Copyright © 2020 Karthik Ravikumar. All rights reserved.
//

import Foundation


class Player {
    
    var name: String
    var score: Int
    
    init(playerName:String) {
        self.name = playerName
        self.score = 0
    }
    
    func play() {
        score = score + 1
    }
}

//
//  Protocols.swift
//  TennisGame
//
//  Created by Karthik Ravikumar on 02/07/20.
//  Copyright © 2020 Karthik Ravikumar. All rights reserved.
//

import Foundation

protocol GameView: class {
    func display(scoreMessage: String)
    func playerOneScore(playerOneScore: String)
    func playerTwoScore(playerTwoScore: String)
}

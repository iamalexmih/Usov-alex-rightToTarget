//
//  RoundGame.swift
//  Usov alex-rightToTarget
//
//  Created by Алексей Попроцкий on 02.05.2022.
//

import Foundation

protocol RoundGameProtocol {
    
    var score: Int {get}
    var randomNumberForRoundGame: Int {get}
    
    func calculateScorePerRound(humanNumber: Int)
}

class RoundGame: RoundGameProtocol {
    
    var score: Int = 0
    var randomNumberForRoundGame: Int = 0
    
    init(randomNumberForRoundGame: Int) {
        self.randomNumberForRoundGame = randomNumberForRoundGame
    }
    
    func calculateScorePerRound(humanNumber: Int) {
        score += 50-(abs(randomNumberForRoundGame-humanNumber))
    }
}


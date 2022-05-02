//
//  Game.swift
//  Usov alex-rightToTarget
//
//  Created by Алексей Попроцкий on 16.04.2022.
//

import Foundation

protocol GameProtocol {
    
    var score: Int {get}
    var secretNumber: Int {get}
    var isGameEnded: Bool {get}
    var humanNumber: Int {get}
    
    func restartGame()
    func startNewRound()
    func calculateScore()
}


class Game: GameProtocol {
    var score = 0
    var humanNumber = 0
    var secretNumber = 0
    var minSecretNumber: Int
    var maxSecretNumber: Int
    var rounds: Int
    var currentRound = 1
    var isGameEnded: Bool {
        if currentRound >= rounds {
            return true
        } else {
            return false
        }
    }
    
    init?(minSecretNumber: Int, maxSecretNumber: Int, rounds: Int) {
        guard minSecretNumber <= maxSecretNumber else {return nil}
        self.rounds = rounds
        self.minSecretNumber = minSecretNumber
        self.maxSecretNumber = maxSecretNumber
        secretNumber = self.getNewRandomNumber()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        secretNumber = getNewRandomNumber()
        currentRound += 1
    }
    
    private func getNewRandomNumber() -> Int {
        Int.random(in: minSecretNumber...maxSecretNumber)
    }
    
    func calculateScore() {
        score += 50-(abs(secretNumber-humanNumber))
    }
    
    
    
    
    
    
    
    
}

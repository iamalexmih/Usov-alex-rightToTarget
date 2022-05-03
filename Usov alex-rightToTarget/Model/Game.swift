//
//  Game.swift
//  Usov alex-rightToTarget
//
//  Created by Алексей Попроцкий on 16.04.2022.
//

import Foundation

protocol GameProtocol {
    
    //var score: Int {get}
    var isGameEnded: Bool {get}
    
    var currentRound: Int {get}
    var generateNumberDelegate: GeneratorProtocol {get}

    func restartGame()
    func startNewRound()
}


class Game: GameProtocol {
    
    var generateNumberDelegate: GeneratorProtocol // Делегатор, просит Генератор, сгенерировать число.
    var roundGame: RoundGameProtocol!
    var scoreForGame = 0
    
    var randomNumberForGame = 0
    var rounds: Int
    var currentRound = 0
    var humanNumber = 0
    var isGameEnded: Bool {
        if currentRound >= rounds {
            return true
        } else {
            return false
        }
    }
    
    init(getGenerateRandomNumber: GeneratorProtocol, rounds: Int) {
        generateNumberDelegate = getGenerateRandomNumber
        self.rounds = rounds
        //self.scoreDelegator = score
        startNewRound()
    }
    
    func restartGame() {
        currentRound = 0
        //scoreDelegator.score = 0
        startNewRound()
    }
    
    func startNewRound() {
        //получаем число от делегата
        randomNumberForGame = generateNumberDelegate.getGenerateRandomNumber()
        //инициирую объект RoundGame, для передачи ему randomNumberForGame.
        //Для подсчета очков внутри класса RoundGame в функции calculateScorePerRound.
        scoreForGame += roundGame.score
        roundGame = RoundGame(randomNumberForRoundGame: randomNumberForGame)
        
        currentRound += 1
    }
    
    
    
    
    
    
    
    
    
    
}

//
//  Game.swift
//  Usov alex-rightToTarget
//
//  Created by Алексей Попроцкий on 16.04.2022.
//

import Foundation

protocol GameProtocol {
    
    var totalScore: Int {get}
    var isGameEnded: Bool {get}
    
    var generateNumberDelegate: GeneratorProtocol {get}

    func restartGame()
    func startNewRound()
}


class Game: GameProtocol {
    
    var generateNumberDelegate: GeneratorProtocol // Делегатор, просит Генератор, сгенерировать число.
    var roundGame: RoundGameProtocol!
    
    var totalScore: Int {
        roundItems.reduce(into: 0) { partialResult, roundItems in
            partialResult = partialResult + roundItems.score
        }
    }
    
    var randomNumberForGame: Int!
    var roundItems: [RoundGameProtocol] = [] //в массиве, каждая сущность roundGame имеет свойство score. Которое будет использовано для подсчета всех очков (totalScore) за 5 раундов.
    private var roundsTotal: Int!
    var humanNumber: Int!
    var isGameEnded: Bool {
        if  roundItems.count >= roundsTotal {
            return true
        } else {
            return false
        }
    }
    
    init (getGenerateRandomNumber: GeneratorProtocol, roundsTotal: Int) {
        generateNumberDelegate = getGenerateRandomNumber
        self.roundsTotal = roundsTotal
        startNewRound()
    }
    
    func restartGame() {
        roundItems = []
        startNewRound()
    }
    
    func startNewRound() {
        //получаем число от делегата
        randomNumberForGame = generateNumberDelegate.getGenerateRandomNumber()
        //инициирую объект RoundGame, для передачи ему randomNumberForGame.
        //Для подсчета очков внутри класса RoundGame в функции calculateScorePerRound.
        roundGame = RoundGame(randomNumberForRoundGame: randomNumberForGame)
        roundItems.append(roundGame)
    }
}

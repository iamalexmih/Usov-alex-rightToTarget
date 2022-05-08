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
    
    //очки за Один раунд! Реализовать подсчет всех очков не получиться, так как класс все время инициализируется в функции рестарта. Для его инициализации необходимо чтоб класс Game уже был создан. Поэтому для подсчета очков сущности этого класса добавляются массив в классе Game.
    var score: Int = 0
    var randomNumberForRoundGame: Int = 0
    
    init(randomNumberForRoundGame: Int) {
        self.randomNumberForRoundGame = randomNumberForRoundGame
    }
    
    //подсчет очков за Один Раунд
    func calculateScorePerRound(humanNumber: Int) {
        score += 50-(abs(randomNumberForRoundGame-humanNumber))
    }
}


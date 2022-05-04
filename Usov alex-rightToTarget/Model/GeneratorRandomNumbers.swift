//
//  File.swift
//  Usov alex-rightToTarget
//
//  Created by Алексей Попроцкий on 02.05.2022.
//

import Foundation

protocol GeneratorProtocol {
    
    func getGenerateRandomNumber () -> Int
    
}

class GeneratorRandomNumbers: GeneratorProtocol {
    
    private let minSecretNumber: Int
    private let maxSecretNumber: Int
    
    init?(minSecretNumber: Int, maxSecretNumber: Int) {
        guard minSecretNumber <= maxSecretNumber else {return nil}
        self.minSecretNumber = minSecretNumber
        self.maxSecretNumber = maxSecretNumber
    }
    
    //делегат для класса Game. Game просит сгенерировать число.
    func getGenerateRandomNumber() -> Int {
       Int.random(in: minSecretNumber...maxSecretNumber)
    }
    
}

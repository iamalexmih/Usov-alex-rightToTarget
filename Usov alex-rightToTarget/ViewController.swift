//
//  ViewController.swift
//  Usov alex-rightToTarget
//
//  Created by Алексей Попроцкий on 16.04.2022.
//

import UIKit

class ViewController: UIViewController {

    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //создаем объект Генератор случ чисел
        let generatorRandomNumber = GeneratorRandomNumbers(minSecretNumber: 1, maxSecretNumber: 50)
    
        game = Game(getGenerateRandomNumber: generatorRandomNumber!, roundsTotal: 5)
        humanLabel.text = ("Human number = 25")
        updateLabels()
    }
    
    //MARK: - IB Outlets and Actions
    
    @IBOutlet weak var secretNumberLabel: UILabel!
    @IBOutlet weak var humanLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBAction func sliderActionHuman(_ sender: UISlider) {
        game.humanNumber = Int(sender.value)
        humanLabel.text = ("Human number = \(game.humanNumber)")
    }
    
    @IBAction func checkNumberButton(_ sender: UIButton) {
        game.roundGame.calculateScorePerRound(humanNumber: game.humanNumber)
        checkIsGameEnded()
        updateLabels()
    }
    
    //MARK: - interaction (взаимодействие) View (Interface) and Model
    
    func checkIsGameEnded() {
        if game.isGameEnded {
            alertWindow()
        } else {
            game.startNewRound()
        }
        //infoLabelText()
        //updateLabelSecretNumber()
    }
    
    func alertWindow() {
        let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(game.totalScore) очков", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Начать Заново", style: .default, handler: {
            [weak self] _ in
            self!.game.restartGame()
            self!.updateLabels()
            })
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
    }
    
    func updateLabels() {
        secretNumberLabel.text = String(game.randomNumberForGame)
        infoLabel.text = "раунд №\(game.roundItems.count), Набранно очков: \(game.totalScore)"
    }
    
    
}


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
        game = Game(minSecretNumber: 1, maxSecretNumber: 50, rounds: 5)
        updateLabelSecretNumber(newNumberRandom: String(game.secretNumber))
        humanLabel.text = ("Human number = 25")
        infoLabelText()
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
        game.calculateScore()
        checkIsGameEnded()
        updateLabelSecretNumber(newNumberRandom: String(game.secretNumber))
        infoLabelText()
    }
    
    //MARK: - interaction (взаимодействие) View (Interface) and Model

    func updateLabelSecretNumber(newNumberRandom: String) {//не знаю почему Усов решил передать параметр в функцию, можно было просто внутри приравнять
        secretNumberLabel.text = newNumberRandom
    }
    
    func checkIsGameEnded() {
        if game.isGameEnded {
            alertWindow()
            game.restartGame()
        } else {
            game.startNewRound()
        }
    }
    
    func alertWindow() {
        let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(game.score) очков", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Начать Заново", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
    }
    
    func infoLabelText() {
        infoLabel.text = "раунд №\(game.currentRound), Набранно очков: \(game.score)"
    }
    
        
    
    
}


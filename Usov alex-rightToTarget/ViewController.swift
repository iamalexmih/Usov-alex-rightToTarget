//
//  ViewController.swift
//  Usov alex-rightToTarget
//
//  Created by Алексей Попроцкий on 16.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        secretNumberRandom()
        humanLabel.text = ("Human number = 25")
        infoLabelText()
    }

    var secretNumber = 0 { // didSet обновление лэйбла при изм загадоного числа.
        didSet {
            secretNumberLabel.text = String(secretNumber)
        }
    }
    var points = 0
    var round = 1
    var humanNumber = 0
    
    
    @IBOutlet weak var secretNumberLabel: UILabel!
    @IBOutlet weak var humanLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    @IBAction func sliderActionHuman(_ sender: UISlider) {
        humanNumber = Int(sender.value)
        humanLabel.text = ("Human number = \(humanNumber)")
        
    }
    
    @IBAction func checkNumberButton(_ sender: UIButton) {
        checkNumber()
        alertWindow()
        secretNumberRandom()
    }
    
    func secretNumberRandom() {
        secretNumber = Int.random(in: 1...50)
    }
    
    func checkNumber() {
        guard round <= 5 else {return}
        let result = abs(secretNumber-humanNumber)
        points += 50-result
        round += 1
        infoLabelText()
    }
    
    func alertWindow() {
        if round > 5 {
            let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(points) очков", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Начать Заново", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            points = 0
            round = 1
            infoLabelText()
        }
    }
    
    func infoLabelText() {
        infoLabel.text = "раунд №\(round), Набранно очков: \(points)"
    }
    
        
    
    
}


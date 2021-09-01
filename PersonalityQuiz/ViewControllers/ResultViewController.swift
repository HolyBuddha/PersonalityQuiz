//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var mainResultLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    var answersFromQuestionsVC: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated:true)
        
        mainResultLabel.text = String(getResultsFromAnswers().rawValue)
        resultLabel.text = getResultsFromAnswers().definition
        
    }
    
    private func getResultsFromAnswers() -> Animal {
        let answers = answersFromQuestionsVC
        
        let catCount = answers.filter { $0.animal == .cat }.count
        let dogCount = answers.filter { $0.animal == .dog }.count
        let turtleCount = answers.filter { $0.animal == .turtle }.count
        let rabbitCount = answers.filter { $0.animal == .rabbit }.count
        
        if catCount > dogCount && catCount > turtleCount && catCount > rabbitCount {
            return Animal.cat
        } else if dogCount > catCount && dogCount > turtleCount && dogCount > rabbitCount {
            return Animal.dog
        } else if turtleCount > catCount && turtleCount > dogCount && turtleCount > rabbitCount {
            return Animal.turtle
        } else {
            return Animal.rabbit
        }
    }
}

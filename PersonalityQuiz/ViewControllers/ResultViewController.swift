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
    
    private var answerForMainResultLabel: String = ""
    private var answerForResultLabel: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated:true)
        getResultsFromAnswers()
        print("\(answersFromQuestionsVC)")
    }
    
    private func getResultsFromAnswers() {
        let answers = answersFromQuestionsVC
        
        let catCount = answers.filter { $0.animal == .cat }.count
        let dogCount = answers.filter { $0.animal == .dog }.count
        let turtleCount = answers.filter { $0.animal == .turtle }.count
        let rabbitCount = answers.filter { $0.animal == .rabbit }.count
        
        if catCount > dogCount && catCount > turtleCount && catCount > rabbitCount {
            mainResultLabel.text = String(Animal.cat.rawValue)
            resultLabel.text = Animal.cat.definition
        } else if dogCount > catCount && dogCount > turtleCount && dogCount > rabbitCount {
            mainResultLabel.text = String(Animal.dog.rawValue)
            resultLabel.text = Animal.dog.definition
        } else if turtleCount > catCount && turtleCount > dogCount && turtleCount > rabbitCount {
            mainResultLabel.text = String(Animal.turtle.rawValue)
            resultLabel.text = Animal.turtle.definition
        } else {
            mainResultLabel.text = String(Animal.rabbit.rawValue)
            resultLabel.text = Animal.rabbit.definition
        }
            
    }
}

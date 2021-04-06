//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var youLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    // 1. Передать сюда массив с ответами
    
    var answersChoosen: [Answer]!
    
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов

    override func viewDidLoad() {
        super.viewDidLoad()

        let result = definitionOfAnswer()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        youLabel.text = "Вы - \(result.rawValue)"
        definitionLabel.text = result.definition
    }
    
    private func definitionOfAnswer() -> AnimalType {
        let countsAnswers = answersChoosen.reduce(into: [:]) { $0[$1.type, default: 0] += 1 }
        let sortedCountsAnswers = countsAnswers.sorted { $0.1 > $1.1 }
        
        return sortedCountsAnswers[0].key
    }

}

//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Избавиться от кнопки возврата назад на экране результатов
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
    // 4. Отобразить результаты в соответствии с этим животным
    
    // использовать функции высшего порядка map и sorted
    // отдельный метод для поиска результата
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Так и не понял чем они отличаются
        navigationItem.hidesBackButton = true
//        navigationItem.setHidesBackButton(true, animated: true)
        
        updateUI()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

extension ResultViewController {
    
    private func getAnimal() -> Animal {
        let animals = answersChosen.map { $0.animal }
        
        let sortedByCount = animals.sorted { an1, an2 in
            animals.filter { $0 == an1 }.count > animals.filter { $0 == an2 }.count
        }
        
        return sortedByCount[0]
    }
    
    private func updateUI() {
        let animal = getAnimal()
        
        animalLabel.text = "Вы - \(animal.rawValue)"
        definitionLabel.text = animal.definition
    }
}

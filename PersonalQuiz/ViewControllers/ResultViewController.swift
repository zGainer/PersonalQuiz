//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        return sortedByCount.first!
    }
    
    private func updateUI() {
        let animal = getAnimal()
        
        animalLabel.text = "Вы - \(animal.rawValue)"
        definitionLabel.text = animal.definition
    }
}

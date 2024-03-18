//
//  ViewController.swift
//  GuessTheFlagUIKit
//
//  Created by Jordan Fraughton on 3/17/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!

    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAskedCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)

        title = "Country: \(countries[correctAnswer].uppercased()), Score: \(score)"
        questionsAskedCount += 1
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String

        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, that's the flag of \(countries[correctAnswer].capitalized)"
            score -= 1
        }

        let ac = UIAlertController(title: title, message: "\(questionsAskedCount < 10 ? "Your score is " : "Final score: ") \(score)", preferredStyle: .alert)

        if questionsAskedCount < 10 {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }

        present(ac, animated: true)
    }
}


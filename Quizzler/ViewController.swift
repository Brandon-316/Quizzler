//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    let questions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionIndex = 0
    var correctAnswers = 0
    
    
    //MARK: Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        questions.list.shuffle()
        updateUI()
    }
    
    
    //MARK: Methods
    func updateUI() {
        questionLabel.text = questions.list[questionIndex].question
        
        progressLabel.text = "\(questionIndex + 1)/\(questions.list.count)"
        scoreLabel.text = "Score: \(correctAnswers)"
        
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(questions.list.count)) * CGFloat(questionIndex + 1)
    }
    
    func nextQuestion() {
        if questionIndex < questions.list.count - 1 {
            questionIndex += 1
        } else {
            let alert = UIAlertController.init(title: "Quiz Complete!", message: "You got \(correctAnswers) correct.\nDo you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        updateUI()
    }
    
    func checkAnswer() {
        if questions.list[questionIndex].answer == pickedAnswer {
            ProgressHUD.showSuccess("Correct!")
            correctAnswers += 1
        } else {
            ProgressHUD.showError("Wrong!")
        }
        nextQuestion()
    }
    
    func startOver() {
        questionIndex = 0
        correctAnswers = 0
        updateUI()
    }


    //MARK: Actions
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
    }
    
}

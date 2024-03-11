//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Adrian Hernandez on 3/10/24.
//

import UIKit

struct Question {
    let text: String
    let answers: [String]
    let correctAnswerIndex: Int
}
class TriviaViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var answerButton1: UIButton!
    
    @IBOutlet weak var answerButton2: UIButton!
    
    @IBOutlet weak var answerButton3: UIButton!
    
    @IBOutlet weak var answerButton4: UIButton!
    
    var questions: [Question] = [
        Question(text: "Which of these dynasties did Marcus Aurelius serve as emperor for?", answers: ["Otto", "Roman", "Greek", "Japanese"], correctAnswerIndex: 1),
        Question(text: "What year did humans land on the moon?", answers: ["1969", "1974", "1999", "1958"], correctAnswerIndex: 0),
        Question(text: "How long does it take the Sun's light to reach the Earth?", answers: ["0 seconds", "13 minutes", "4 hours", "8 minutes"], correctAnswerIndex: 3),
        
    ]
    
    var currentQuestionIndex = 0
    var selectedAnswerIndex: Int?
    var displayingResults = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
        
        
    }
    
    
    
    func displayQuestion() {
        let question = questions[currentQuestionIndex]
        questionLabel.text = question.text
        questionLabel.numberOfLines = 0 // Allow multiple lines
        questionLabel.lineBreakMode = .byWordWrapping
        
        // Ensure all answer buttons are enabled and visible
        answerButton1.isHidden = false
        answerButton2.isHidden = false
        answerButton3.isHidden = false
        answerButton4.isHidden = false
        answerButton1.isEnabled = true
        answerButton2.isEnabled = true
        answerButton3.isEnabled = true
        answerButton4.isEnabled = true
        
        // Set answer button titles
        answerButton1.setTitle(question.answers[0], for: .normal)
        answerButton2.setTitle(question.answers[1], for: .normal)
        answerButton3.setTitle(question.answers[2], for: .normal)
        answerButton4.setTitle(question.answers[3], for: .normal)
        
        questionsRemainingLabel.text = "Questions remaining: \(questions.count - currentQuestionIndex)"

    }
    
    
    
    @IBOutlet weak var questionsRemainingLabel: UILabel!
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        
        guard currentQuestionIndex < questions.count else {
            print("Current question index is out of range")
            return
        }
        let question = questions[currentQuestionIndex]
        
        var selectedAnswerIndex = -1
        switch sender {
        case answerButton1:
            selectedAnswerIndex = 0
        case answerButton2:
            selectedAnswerIndex = 1
        case answerButton3:
            selectedAnswerIndex = 2
        case answerButton4:
            selectedAnswerIndex = 3
        default:
            print("Unexpected button tapped")
            return
        }
        
        var message = ""
        if selectedAnswerIndex == question.correctAnswerIndex {
            // Handle correct answer
            print("Correct!")
            let alertController = UIAlertController(title: "CORRECT!", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        } else {
            // Handle incorrect answer
            print("Incorrect!")
            let alertController = UIAlertController(title: "Sorry, thats incorrect!", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            
            let correctAnswer =
            question.answers[question.correctAnswerIndex]
            message += "\nThe correct answer is: \(correctAnswer)"
        }
        
        // Show pop-up message
        self.selectedAnswerIndex = selectedAnswerIndex

        
        // Move to the next question or end the game
        currentQuestionIndex += 1
        if currentQuestionIndex < questions.count {

            displayQuestion()
        } else {
            // End of game
            questionsRemainingLabel.text = "Questions remaining: 0"
            displayResults()
            
        }
    }
    

    func displayResults() {
        // Ensure results are displayed only once and no alert is currently presented
        guard !displayingResults else { return }
        displayingResults = true
        
        // Calculate the number of correct answers
        var correctAnswersCount = 0
        for (index, question) in questions.enumerated() {
            if let selectedAnswerIndex = selectedAnswerIndex, index < questions.count {
                if question.correctAnswerIndex == selectedAnswerIndex {
                    correctAnswersCount += 1
                }
            }
        }
        
        // Create a message with the result
        let resultMessage = "You got \(correctAnswersCount) out of \(questions.count) correct!"
        
        // Display an alert with the result and an option to restart the game
        let alertController = UIAlertController(title: "Results", message: resultMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Restart", style: .default) { _ in
            // Restart the game
            self.restartGame()
        })
        
        // Check if another alert is already being presented
        if let presentedVC = presentedViewController {
            presentedVC.dismiss(animated: true) {
                self.present(alertController, animated: true)
            }
        } else {
            present(alertController, animated: true)
        }
        
        // Reset displayingResults flag after the alert is presented
        displayingResults = false
    }




    func restartGame() {
        // Reset current question index
        currentQuestionIndex = 0
        
        // Shuffle questions for a new game (optional)
        
        // Display the first question
        displayQuestion()
    }


    

    }


        
    

    

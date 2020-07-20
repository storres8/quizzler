import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        Question(question: "A slug's blood is green.", answer: "True"),
        Question(question: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Question(question: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Question(question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Question(question: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Question(question: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Question(question: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Question(question: "Google was originally called 'Backrub'.", answer: "True"),
        Question(question: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Question(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Question(question: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Question(question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
    ]
    
    var questionNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        progressBar.progress = 0.0
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle // True or False
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if questionNumber < quiz.count - 1{
            questionNumber += 1
            Timer.scheduledTimer(timeInterval: 0.20, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            // the selector is what will run after the timerInterval is up
            
        } else {
            questionNumber = 0
            Timer.scheduledTimer(timeInterval: 0.20, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            
        }
        
    }
    
    
    @objc func updateUI(){
        questionLabel.text = quiz[questionNumber].question
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        let current = Float(questionNumber) + 1.0
        progressBar.progress = Float(current/12.0)
    }
    
}


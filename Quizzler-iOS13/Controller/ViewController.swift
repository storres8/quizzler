import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceC: UIButton!
    @IBOutlet weak var choiceA: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        progressBar.progress = 0.0
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle // True or False
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score \(quizBrain.getScore())"
        
        choiceA.backgroundColor = UIColor.clear
        let choiceAText = quizBrain.getAnswers(choice: 0)
        choiceA.setTitle(choiceAText, for: .normal)
        
        choiceC.backgroundColor = UIColor.clear
        let choiceCText = quizBrain.getAnswers(choice: 2)
        choiceC.setTitle(choiceCText, for: .normal)
        
        choiceB.backgroundColor = UIColor.clear
        let choiceBText = quizBrain.getAnswers(choice: 1)
        choiceB.setTitle(choiceBText, for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
    }
    
}


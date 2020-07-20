import Foundation

struct QuizBrain {
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
    var score = 0
    
    // _ is the argument name for external purposes. While usersAnswer is the interal (parameter) name.
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].question
    }
    
    func getProgress() -> Float {
        let current = Float(questionNumber) + 1.0
        return Float(current/12.0)
    }
    
    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1{
            questionNumber += 1
            
        } else {
            questionNumber = 0
            score = 0
            
        }
    }
    
    func getScore( )-> Int{
        return score
    }

}

//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Raj Tailor on 2/24/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain{
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Question(q: "Pigs have sweat glands", a: "False"),
        Question(q: "Popping your knuckles gives you arthritis", a: "False"),
        Question(q: "Crows are some of the smartest birds in the world.", a: "True"),
        Question(q: "Vikings wore horns on their helmets.", a: "False"),
        Question(q: "King Arthur was a real man.", a: "False"),
        Question(q: "The smallest dinosaurs were about the size of chickens.", a: "True"),
        Question(q: "Leonardo da Vinci invented high heels.", a: "True"),
        Question(q: "Cuba is the only Caribbean island with a railway.", a: "True"),
        Question(q: "Camels store water in their humps.", a: "False"),
        Question(q: "Babe Ruth kept a cabbage leaf under his baseball cap.", a: "True"),
        Question(q: "The tallest building in the world is the Empire State Building.", a: "True"),
        Question(q: "Rubies are just red sapphires.", a: "True"),
        Question(q: "Soy protien is just as effective as whey or casein protiens in muscle growth.", a: "False"),
        Question(q: "Japan has square watermelons.", a: "True"),
        Question(q: "Pinocchio was the first animated full-color Walt Disney feature film", a: "False"),
        Question(q: "There are 100 dimples on a golf ball.", a: "False"),
        Question(q: "Maria of Super Maria Bros. fame was once a carpenter.", a: "True")
    ]
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == quiz[questionNumber].answer{
            score+=1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].test
    }
    func getProgress() -> Float {
        return Float(questionNumber)/Float(quiz.count)
    }
    func getScore() -> String {
        return "\(score)/\(quiz.count)"
    }
    
    mutating func nextQuestion(){
        if questionNumber < quiz.count - 1{
            questionNumber+=1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
}

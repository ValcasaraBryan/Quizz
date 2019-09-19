//
//  File.swift
//  Open_Quizz
//
//  Created by Bryan Valcasara on 23/03/2019.
//  Copyright © 2019 Bryan Valcasara. All rights reserved.
//

import Foundation

class Game {
    var score = 0
    
    private var questions = [Question]()
    private var currentIndex = 0
    
    var state: State = .ongoing
    
    enum State {
        case ongoing, over
    }
    
    var currentQuestion: Question {
        return questions[currentIndex]
    }
    
    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
     
//        QuestionManager.shared.get(completionHandler: reveiveQuestions(_:))
        QuestionManager.shared.get{ (questions) in

            self.questions = questions
            self.state = .ongoing

            // creation de l'emission d'une notification pour le controlleur (notification aveugle)
            let name = Notification.Name(rawValue: "QuestionsLoaded")
            let notification = Notification.init(name: name)
            NotificationCenter.default.post(notification)
        }
    }
    
//    private func reveiveQuestions(_ questions: [Question]) {
//        self.questions = questions
//        self.state = .ongoing
//        let name = Notification.Name(rawValue: "QuestionsLoaded")
//        let notification = Notification.init(name: name)
//        NotificationCenter.default.post(notification)
//    }
    
    func answerCurrentQuestion(answer: Bool) {
        if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
            score += 1
        }
        goToNextQuestion()
    }
    
    private func goToNextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            finishGame()
        }
    }
    
    private func finishGame() {
        state = .over
    }
}

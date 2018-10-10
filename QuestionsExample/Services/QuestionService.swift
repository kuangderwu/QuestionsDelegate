//
//  QuestionService.swift
//  QuestionsExample
//
//  Created by apple on 2018/10/6.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import Foundation

class QuestionServices {
    
    //MAKR: internal data use private access right
    
    private var questions = [Question]()
    
    init() {
        questions.append(Question(text: "Question Text 1", point: 5, answer: true))
        questions.append(Question(text: "Question Text 2", point: 5, answer: true))
        questions.append(Question(text: "Question Text 3", point: 5, answer: false))
        questions.append(Question(text: "Question Text A", point: 5, answer: true))
        questions.append(Question(text: "Question Text B", point: 5, answer: true))
        questions.append(Question(text: "Question Text C", point: 5, answer: false))
    }
    //MARK: only read throu getAll()
    func getAll() -> [Question] {
        return questions
    }
    //MARK: only write in throu add()
    func add(question: Question) {
        questions.append(question)
    }
}

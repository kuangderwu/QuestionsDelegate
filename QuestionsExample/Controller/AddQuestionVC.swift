//
//  AddQuestionVC.swift
//  QuestionsExample
//
//  Created by apple on 2018/10/6.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import UIKit

protocol AddQuestionDelegate {
    func addQuestionDidSaved(question: Question, sender: UIViewController)
    func addQuestionDidClosed(sender: UIViewController)
}

class AddQuestionVC: UIViewController {
    
    var addQuestionView: AddQuestionView!
    var questionAnswer: Bool = true
    var delegate: AddQuestionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        //MARK: Define UI Actions
        
        addQuestionView.questionAnswerSegment.addTarget(self, action: #selector(answerSegmentChanged), for: UIControl.Event.valueChanged)
        addQuestionView.item.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(saveBtnTouched))
        addQuestionView.item.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(closeBtnTouched))
        
    }
    
    @objc func answerSegmentChanged() {
        questionAnswer = addQuestionView.questionAnswerSegment.selectedSegmentIndex == 0 ? true : false
    }
    
    @objc func saveBtnTouched() {
        guard let questionText = addQuestionView.questionTextField.text else { return }
        guard let questionPoint = Int(addQuestionView.questionPointField.text!) else { return }
        let addQuestion = Question(text: questionText, point: questionPoint, answer: questionAnswer)
        delegate?.addQuestionDidSaved(question: addQuestion, sender: self)
    }
    
    @objc func closeBtnTouched() {
        delegate?.addQuestionDidClosed(sender: self)
    }
    
    private func setupLayout() {
        addQuestionView = AddQuestionView(frame: self.view.frame)
        addQuestionView.frame = self.view.bounds
        view.addSubview(addQuestionView)
    }


}

//
//  AddQuestion.swift
//  QuestionsExample
//
//  Created by apple on 2018/10/6.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import UIKit

class AddQuestionView: UIView {

    var navibar: UINavigationBar!
    var item: UINavigationItem!
    var questionTextField: UITextField!
    var questionPointField: UITextField!
    var questionAnswerSegment: UISegmentedControl!
    var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.backgroundColor = UIColor.lightGray
        
        navibar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: self.frame.size.width, height: 120.0))
        self.addSubview(navibar)
        item = UINavigationItem(title: "Add New Questions")
        navibar.items = [item]
        
        
        questionTextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.borderStyle = .roundedRect
            textField.placeholder = "Enter the question text"
            textField.textColor = UIColor.black
            textField.font = UIFont.systemFont(ofSize: 14)
            return textField
        }()
        
        questionPointField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.borderStyle = .roundedRect
            textField.placeholder = "Enter the question point"
            textField.textColor = UIColor.black
            textField.font = UIFont.systemFont(ofSize: 14)
            return textField
        }()
        
        questionAnswerSegment = {
            let segment = UISegmentedControl(items: ["True", "False"])
            segment.translatesAutoresizingMaskIntoConstraints = false
            segment.tintColor = UIColor.black
            segment.selectedSegmentIndex = 0
            return segment
        }()
        
        stackView = UIStackView(arrangedSubviews: [questionTextField, questionPointField, questionAnswerSegment])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2)
            ])
        
    }

}

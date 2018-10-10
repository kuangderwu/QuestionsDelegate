//
//  RootVC.swift
//  QuestionsExample
//
//  Created by apple on 2018/10/6.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import UIKit

class RootVC: UIViewController, UITableViewDelegate, UITableViewDataSource, AddQuestionDelegate {

    
    var rootView: RootView!
    var tableView: UITableView!
    var questions: [Question]!
    var questionService = QuestionServices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Question List"
        setupLayout()
        tableView.delegate = self
        tableView.dataSource = self
        
        getQuestions()
        updateUI()
    }
    
    func getQuestions() {
        questions = questionService.getAll()
    }
    
    
    func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setupLayout() {
        rootView = RootView(frame: self.view.frame)
        rootView.frame = self.view.bounds
        view.addSubview(rootView)
        tableView = rootView.tableView
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addBtnTouched))
    }
    
    @objc func addBtnTouched() {
        let addQuestionVC = AddQuestionVC()
        addQuestionVC.delegate = self
        self.present(addQuestionVC, animated: true, completion: nil)
    }
    
    //MARK: AddQuestionDelegate protocol implementation
    
    func addQuestionDidSaved(question: Question, sender: UIViewController) {
        sender.dismiss(animated: true, completion: nil)
        questionService.add(question: question)
        getQuestions()
        updateUI()
    }
    
    func addQuestionDidClosed(sender: UIViewController) {
        sender.dismiss(animated: true, completion: nil)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = questions[indexPath.row].questionText
        return cell
    }
    

}

//
//  SelectQuestionGroupViewController.swift
//  RabbleWabble
//
//  Created by Anuj Rajput on 12/10/20.
//

import UIKit

public class SelectQuestionGroupViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet internal var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    // MARK: - Properties
    public let questionGroups = QuestionGroup.allGroups()
    private var selectQuestionGroup: QuestionGroup!
    
}

// MARK: - UITableViewDataSource
extension SelectQuestionGroupViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionGroups.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupCell") as! QuestionGroupCell
        let questionGroup = questionGroups[indexPath.row]
        cell.titleLabel.text = questionGroup.title
        return cell
    }
}

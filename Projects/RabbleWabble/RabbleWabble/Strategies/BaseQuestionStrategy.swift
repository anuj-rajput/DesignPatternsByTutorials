//
//  BaseQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Anuj Rajput on 02/11/20.
//

import Foundation

public class BaseQuestionStrategy: QuestionStrategy {
    
    // MARK: - Properties
    public var correctCount: Int {
        get { questionGroup.score.correctCount }
        set { questionGroup.score.correctCount = newValue }
    }
    public var incorrectCount: Int {
        get { questionGroup.score.incorrectCount }
        set { questionGroup.score.incorrectCount = newValue }
    }
    private var questionGroupCaretaker: QuestionGroupCaretaker
    
    private var questionGroup: QuestionGroup {
        questionGroupCaretaker.selectedQuestionGroup
    }
    private var questionIndex = 0
    private let questions: [Question]
    
    // MARK: - Object Lifecycle
    public init(questionGroupCaretaker: QuestionGroupCaretaker, questions: [Question]) {
        self.questionGroupCaretaker = questionGroupCaretaker
        self.questions = questions
        
        self.questionGroupCaretaker.selectedQuestionGroup.score = QuestionGroup.Score()
    }
    
    // MARK: - QuestionStrategy
    public var title: String {
        questionGroup.title
    }
    
    public func currentQuestion() -> Question {
        questions[questionIndex]
    }
    
    public func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questions.count else {
            return false
        }
        questionIndex += 1
        return true
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    public func questionIndexTitle() -> String {
        "\(questionIndex + 1)/\(questions.count)"
    }
}

//
//  SequentialQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Anuj Rajput on 13/10/20.
//

public class SequentialQuestionStrategy: BaseQuestionStrategy {

    // MARK: - Object Lifecycle
    public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
        let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
        
        let questions = questionGroup.questions
        
        self.init(questionGroupCaretaker: questionGroupCaretaker, questions: questions)
    }
}

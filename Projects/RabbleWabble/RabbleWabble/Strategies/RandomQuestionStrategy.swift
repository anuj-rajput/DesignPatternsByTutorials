//
//  RandomQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Anuj Rajput on 13/10/20.
//

import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: BaseQuestionStrategy {
    
    // MARK: - Object Lifecycle
    public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
        let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
        
        let randomSource = GKRandomSource.sharedRandom()
        let questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
        
        self.init(questionGroupCaretaker: questionGroupCaretaker, questions: questions)
    }
}

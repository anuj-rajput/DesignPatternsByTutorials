//
//  QuestionGroup.swift
//  RabbleWabble
//
//  Created by Anuj Rajput on 12/10/20.
//

public class QuestionGroup: Codable {
    public class Score: Codable {
        public var correctCount: Int = 0
        public var incorrectCount: Int = 0

        public init() { }
    }

    public let questions: [Question]
    public let title: String
    public var score: Score
    
    public init(questions: [Question], score: Score = Score(), title: String) {
        self.questions = questions
        self.score = score
        self.title = title
    }
}

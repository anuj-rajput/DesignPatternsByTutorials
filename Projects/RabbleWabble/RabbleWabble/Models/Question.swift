//
//  Question.swift
//  RabbleWabble
//
//  Created by Anuj Rajput on 12/10/20.
//

public class Question: Codable {
    public let answer: String
    public let hint: String?
    public let prompt: String
    
    public init(answer: String, hint: String?, prompt: String) {
        self.answer = answer
        self.hint = hint
        self.prompt = prompt
    }
}

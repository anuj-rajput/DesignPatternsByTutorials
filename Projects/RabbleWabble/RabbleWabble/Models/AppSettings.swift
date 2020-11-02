//
//  AppSettings.swift
//  RabbleWabble
//
//  Created by Anuj Rajput on 14/10/20.
//

import Foundation

public class AppSettings {
    private struct Keys {
        static let questionStrategy = "questionStrategy"
    }
    
    // MARK: - Instance Properties
    private let userDefaults = UserDefaults.standard
    
    public var questionStrategyType: QuestionStrategyType {
        get {
            let rawValue = userDefaults.integer(forKey: Keys.questionStrategy)
            return QuestionStrategyType(rawValue: rawValue)!
        }
        set {
            userDefaults.setValue(newValue.rawValue, forKey: Keys.questionStrategy)
        }
    }
    
    // MARK: - Static Properties
    public static let shared = AppSettings()
    
    // MARK: - Object Lifecycle
    private init() { }
    
    // MARK: - Instance Methods
    public func questionStrategy(
        for questionGroupCaretaker: QuestionGroupCaretaker) -> QuestionStrategy {
        return questionStrategyType.questionStrategy(
            for: questionGroupCaretaker)
    }
}

// MARK: - QuestionStrategyType
public enum QuestionStrategyType: Int, CaseIterable {
    
    case random
    case sequential
    
    // MARK: - Instance Method
    public func title() -> String {
        switch self {
        case .random:
            return "Random"
        case .sequential:
            return "Sequential"
        }
    }
    
    public func questionStrategy(
        for questionGroupCaretaker: QuestionGroupCaretaker) -> QuestionStrategy {
        switch self {
        case .random:
            return RandomQuestionStrategy(
                questionGroupCaretaker: questionGroupCaretaker)
        case .sequential:
            return SequentialQuestionStrategy(
                questionGroupCaretaker: questionGroupCaretaker)
        }
    }
}

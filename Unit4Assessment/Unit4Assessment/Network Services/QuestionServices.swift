//
//  QuestionServices.swift
//  Unit4Assessment
//
//  Created by Ian Bailey on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//


import Foundation

public enum QuestionServiceError: Error {
  case resourcePathDoesNotExist
  case contentsNotFound
  case decodingError(Error)
}

final class QuestionService {
  public static func fetchCards() throws -> [Card] {
    guard let path = Bundle.main.path(forResource: "questions", ofType: "json") else {
      throw QuestionServiceError.resourcePathDoesNotExist
    }
    guard let json = FileManager.default.contents(atPath: path) else {
      throw QuestionServiceError.contentsNotFound
    }
    do {
      let cards = try JSONDecoder().decode([Card].self, from: json)
      return cards
    } catch {
      throw QuestionServiceError.decodingError(error)
    }
  }
}

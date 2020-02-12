//
//  CardModel.swift
//  Unit4Assessment
//
//  Created by Ian Bailey on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//



import Foundation

//struct Cards: Codable {
//    let cards: [Card]
//}

struct Card: Codable & Equatable {
    let id: String
    let quizTitle: String
    let facts: [String]
}

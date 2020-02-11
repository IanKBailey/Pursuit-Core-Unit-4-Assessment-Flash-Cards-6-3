//
//  CardModel.swift
//  Unit4Assessment
//
//  Created by Ian Bailey on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//



import Foundation

struct Cards: Codable {
    let cardListType: String
    let apiVersion: String
    let cards: [Card]
}

struct Card: Codable {
    let id: String
    let cardTitle: String
    let facts: [String]
}

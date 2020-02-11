//
//  Unit4AssessmentTests.swift
//  Unit4AssessmentTests
//
//  Created by Alex Paul on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import XCTest
@testable import Unit4Assessment

class Unit4AssessmentTests: XCTestCase {

    func testCardData() {
        
        
    let jsonData = """
        {
        "cardListType": "q and a",
        "apiVersion": "1.2.3",
        "cards": [
        {
        "id": "1",
        "cardTitle": "What is the difference between a synchronous & an asynchronous task?",
        "facts": [
            "Synchronous: waits until the task have completed.",
            "Asynchronous: completes a task in the background and can notify you when complete."
        ]
        }]
        }
        """.data(using: .utf8)!
    
    
    let expectedCard = "What is the difference between a synchronous & an asynchronous task?"
    
    do {
        let cards = try JSONDecoder().decode(Cards.self, from: jsonData)
        let card = cards.cards.first?.cardTitle ?? ""
        XCTAssertEqual(expectedCard, card)
    } catch {
        XCTFail("decoding error \(error)")
    }
}
}

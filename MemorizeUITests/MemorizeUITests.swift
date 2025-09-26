//
//  MemorizeUITests.swift
//  MemorizeUITests
//
//  Created by Edwin Mbaabu on 9/9/25.
//

import XCTest
@testable import Memorize

final class MemorizeUITests: XCTestCase {
    private var app: XCUIApplication!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        app = nil
    }

    @MainActor
    
    func testFirstScreenHasCards() {
        XCTAssertTrue(app.otherElements["cards"].waitForExistence(timeout: 5), "Cards not found")
    }
    
//    func testCardIsTapable() {
//        let card = app.otherElements["cards"].firstMatch
//        XCTAssertTrue(card.waitForExistence(timeout: 5))
//        card.tap()
//        XCTAssertTrue(app.)
//    }
    func testCardFlipsOnTap() {
        // Grab the first visible card
        let firstCard = app.otherElements["cards"].firstMatch

        XCTAssertTrue(firstCard.waitForExistence(timeout: 5), "Card should exist")

        // State before tap
        XCTAssertEqual(firstCard.value as? String, "face down", "Card should start face down")

        // Tap to flip
        firstCard.tap()

        // State after tap
        XCTAssertEqual(firstCard.value as? String, "face up", "Card should be face up after tap")
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}

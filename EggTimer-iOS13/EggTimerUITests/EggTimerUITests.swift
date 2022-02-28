//
//  EggTimerUITests.swift
//  EggTimerUITests
//
//  Created by Muhammed Kurfeyiz - Yazılım Uzmanı on 23.02.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import XCTest

class EggTimerUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEggs() {
        Timer(app: self.app).checkTitle().tapAllButtons()
    }
    
    func testTitle_ForBeginning() {
//        app.launch()
        let title = app.staticTexts["How do you like your eggs?"]
        XCTAssertTrue(title.exists)
    }
    
    func testButtonsAndTitlesAfterTap() {
        
//        let app = XCUIApplication()
//        let button = app.buttons
//        app.launch()
        let message = app.staticTexts["Done!"]
        let soft = app/*@START_MENU_TOKEN@*/.staticTexts["Soft"]/*[[".buttons[\"Soft\"].staticTexts[\"Soft\"]",".staticTexts[\"Soft\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        print(soft.label)
        tapElement(element: soft, message: message)

        let medium = app/*@START_MENU_TOKEN@*/.staticTexts["Medium"]/*[[".buttons[\"Medium\"].staticTexts[\"Medium\"]",".staticTexts[\"Medium\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tapElement(element: medium, message: message)

        let hard = app.staticTexts["Hard"]
        tapElement(element: hard, message: message)
        
        let progressBar = app.progressIndicators["Progress"]
        XCTAssertTrue(app.progressIndicators["Progress"].exists)
        
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func tapElement(element: XCUIElement, message: XCUIElement) {
        if element.exists {
            element.tap()
            if !app.staticTexts["Eggs are boiling..."].exists {
                XCTAssertFalse(true)
            } else {
                expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: message, handler: nil)
                waitForExpectations(timeout: 7, handler: nil)
                XCTAssertTrue(message.exists)
            }
        } else {
            XCTAssertFalse(true)
        }
    }
}

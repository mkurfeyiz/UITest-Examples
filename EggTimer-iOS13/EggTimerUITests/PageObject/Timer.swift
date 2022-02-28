//
//  Timer.swift
//  EggTimerUITests
//
//  Created by Muhammed Kurfeyiz - Yazılım Uzmanı on 23.02.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import XCTest

protocol Screen {
    var app: XCUIApplication {get}
}

class Timer : Screen {
    var app: XCUIApplication
    var hardness: [String:XCUIElement] = [:]
    
    init(app: XCUIApplication) {
        self.app = app
        self.hardness = [
            Buttons.soft : app.staticTexts["Soft"],
            Buttons.medium : app.staticTexts["Medium"],
            Buttons.hard : app.staticTexts["Hard"]
        ]
    }
    
    private enum Buttons {
        static let soft = "Soft"
        static let medium = "Medium"
        static let hard = "Hard"
    }
    
    func checkTitle() -> Self {
        let title = self.app.staticTexts["How do you like your eggs?"]
        XCTAssertTrue(title.exists)
        return self
    }
    
    func tapButton(element: XCUIElement) -> Done {
        element.tap()
        print(element.label)
        return Done(app: self.app, timer: self)
    }
    
    func tapAllButtons() -> Self {
        tapButton(element: hardness[Buttons.soft]!).eggsBoilingFail().eggsBoiledFail().eggsBoiled()
        tapButton(element: hardness[Buttons.medium]!).eggsBoilingFail().eggsBoiledFail().eggsBoiled()
        tapButton(element: hardness[Buttons.hard]!).eggsBoilingFail().eggsBoiledFail().eggsBoiled()
        
        return self
    }
}

//
//  Done.swift
//  EggTimerUITests
//
//  Created by Muhammed Kurfeyiz - Yazılım Uzmanı on 23.02.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import XCTest

class Done : Screen {
    
    var boiling: XCUIElement!
    var boiled: XCUIElement!
    
    var app: XCUIApplication
    var timer: Timer
    
    init(app: XCUIApplication, timer: Timer) {
        self.app = app
        self.timer = timer
        
        self.boiling = self.app.staticTexts["Eggs are boiling..."]
        self.boiled = self.app.staticTexts["Done!"]
    }
    
    func eggsBoilingFail() -> Self {
        XCTAssertTrue(self.boiling.exists)
        return self
    }
    
    func eggsBoiledFail() -> Self {
        XCTAssertTrue(self.boiled.waitForExistence(timeout: 7))
        return self
    }
    
    func eggsBoiled() -> Timer {
        XCTAssertTrue(true)
        print("Eggs are boiled. Badabim badabom")
        return self.timer
    }
}


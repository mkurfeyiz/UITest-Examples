//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    var count: Int?
    var totalTime: Int?
    
    var timer = Timer()
    
    let eggTimes = ["Soft" : 3, "Medium" : 4, "Hard" : 5]
    
    @IBOutlet weak var lblDone: UILabel!
    @IBOutlet weak var pwProgress: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
//        pwProgress.progress = 1.0
        lblDone.text = "Eggs are boiling..."
        count = 1
        totalTime = eggTimes[sender.currentTitle!]!
        print(sender.currentTitle!)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if count! <= totalTime! {
//            if count! % 2 == 0 {
//                lblDone.text = "Eggs are boiling."
//            } else {
//                lblDone.text = "Eggs are boiling..."
//            }
            print(count!)
            pwProgress.progress = Float(count!) / Float(totalTime!)
            count! += 1
        } else {
            lblDone.text = "Done!"
            timer.invalidate()
            playAlarm()
        }
    }

    func playAlarm() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url)

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

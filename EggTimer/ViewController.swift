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
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        let totalTime = eggTimes[hardness]!
        var timePassed = 0
        
        timer.invalidate()
        progressBar.progress = 0.0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if timePassed < totalTime {
                    timePassed += 1
                    self.progressBar.progress = Float(timePassed) / Float(totalTime)
                } else {
                    Timer.invalidate()
                    self.titleLabel.text = "DONE!"
                    self.timeUpSound()
                }
            }
       
    }
    
    func timeUpSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}

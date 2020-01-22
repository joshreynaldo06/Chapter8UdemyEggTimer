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
    
    var musicPlayer: AVAudioPlayer?
    
    @IBOutlet weak var timerProgressView: UIProgressView!
    
    let eggTimes : [String:Int] = ["Soft" : 10, "Medium" : 420, "Hard" : 720]
    
    var secondsRemaining : Int = 0
    var totalTimes : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    func playSound(){
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else{
                   return print("Wrong extension file")
               }
               musicPlayer = try! AVAudioPlayer(contentsOf: url)
               musicPlayer?.play()
    }
    
    @IBAction func hardnessSelected (_ sender: UIButton){
        print("\(sender.currentTitle!)")
        
        let hardness = sender.currentTitle!
        
        totalTimes = eggTimes["\(hardness)"]!
        
        
        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
           }
        
           @objc func update(){
               if secondsRemaining < totalTimes {
                    print("\(secondsRemaining) seconds")
                print(totalTimes)
                   secondsRemaining += 1
                timerProgressView.progress = Float((Float(secondsRemaining) / Float(totalTimes)))
                
                print(timerProgressView.progress)
                
               } else {
                playSound()
            }
            
        
    }
}

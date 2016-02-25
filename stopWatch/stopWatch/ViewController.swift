//
//  ViewController.swift
//  stopWatch
//
//  Created by 章宇 on 16/2/24.
//  Copyright © 2016年 章宇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Counter : Double = 0
    var Timer : NSTimer = NSTimer()
    var isPlaying = false
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func reset(sender: AnyObject) {
        Timer.invalidate()
        isPlaying = false
        Counter = 0
        time.text = String(Counter)
    }

    @IBOutlet weak var time: UILabel!
    
    
    override func viewDidLoad() {
        time.text = String(Counter)
        super.viewDidLoad()
    }
    
    @IBAction func play(sender: AnyObject) {
        if isPlaying {
        return
        }
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
        isPlaying = true
        
    }
    
    @IBAction func pause(sender: AnyObject) {
        Timer.invalidate()
        isPlaying = false
    }
    
    func updateTimer() {
    Counter = Counter + 0.1
        time.text = String(format: "%.1f", Counter)
    }
}


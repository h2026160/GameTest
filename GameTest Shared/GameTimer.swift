//
//  GameTimer.swift
//  GameTest
//
//  Created by H2026160 on 26/3/2025.
//

import Foundation
import SpriteKit

class GameTimer{
    static let shared=GameTimer()
    var Time:Double=0.0
    var timer:Timer?
    
    init() {}
    
    func startTimer(){
        timer=Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ _ in
            self.Time+=0.01
        }
    }
    
    func stopTimer(){
        timer?.invalidate()
        timer=nil
    }
}

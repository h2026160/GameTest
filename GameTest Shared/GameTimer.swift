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
    var Time:Double=0
    var timer:Timer?
    
    private init() {}
    
    func start(){
        timer=Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer
            
        }
    }
}

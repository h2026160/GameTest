//
//  Passenger.swift
//  GameTest
//
//  Created by H2026160 on 15/9/2025.
//

import Foundation
import SpriteKit

class Passenger{
    private var startStationCode: Int
    private var code: String
    
    init(code: String) {
        self.startStationCode = Int.random(in: 1...200)
            //represents 1/200 or 0.5%
        self.code = code
    }
    
    func getStartStation() -> Int{
        return self.startStationCode
    }
}

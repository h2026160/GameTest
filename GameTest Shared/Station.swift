//
//  Station.swift
//  GameTest
//
//  Created by H2026160 on 4/12/2025.
//

import Foundation
import SpriteKit

class Station{
    var stationName: String
    var stationNumber: Int
    var northBoundPassengers: [Passenger]=[]
    var southBoundPassengers: [Passenger]=[]
    
    init(stationName: String, stationNumber: Int) {
        self.stationName = stationName
        self.stationNumber = stationNumber
    }
}

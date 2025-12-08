//
//  Passenger.swift
//  GameTest
//
//  Created by H2026160 on 15/9/2025.
//

import Foundation
import SpriteKit

class Passenger{
    private var passengerDistribution: [Int]=[0,20,110,170,200]
    
    private var startStationCode: Int
    var startStationNumber: Int=0
    private var endStationCode: Int
    var endStationNumber: Int=0
    private var code: String
    
    init(code: String) {
        self.startStationCode = Int.random(in: 1...200)
            //represents 1/200 or 0.5%
        
        for i in 1...4{
            if((self.startStationCode<=passengerDistribution[i])&&(self.startStationCode>passengerDistribution[i-1])){
                self.startStationNumber=i
            }
        }
        
        var modifiedPassengerDistribution=passengerDistribution
        modifiedPassengerDistribution.remove(at: startStationNumber)
        if (startStationNumber != 4){
            let difference=passengerDistribution[startStationNumber]-passengerDistribution[startStationNumber-1]
            for i in startStationNumber...3{
                modifiedPassengerDistribution[i]-=difference
            }
        }
        
        self.endStationCode = Int.random(in: 1...(200-(passengerDistribution[startStationNumber]-passengerDistribution[startStationNumber-1])))
        
        for i in 1...3{
            if((self.endStationCode<=modifiedPassengerDistribution[i])&&(self.endStationCode>modifiedPassengerDistribution[i-1])){
                if(i<startStationNumber){
                    self.endStationNumber=i
                }
                else{
                    self.endStationNumber=i+1
                }
            }
        }
        
        self.code = code
    }
    
    func getStartStation() -> Int{
        return self.startStationCode
    }
    
    func getTicketPrice() -> Int{
        var basePrice=1
        //print(abs(self.startStationNumber-self.endStationNumber))
        if(abs(self.startStationNumber-self.endStationNumber)<=6){
            return 1
        }
        else{
            return 1
        }
    }
}

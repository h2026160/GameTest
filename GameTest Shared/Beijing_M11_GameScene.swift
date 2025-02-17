//
//  Beijing_M11_GameScene.swift
//  GameTest
//
//  Created by H2026160 on 11/2/2025.
//

import SpriteKit

class Beijing_M11_GameScene: SKScene{
    private var MainNode=SKNode()
    private var hasScheduleButton: Bool=true
    
    override func didMove(to view: SKView) {
        setUpButton()
    }
}
extension Beijing_M11_GameScene{
    func setUpButton(){
        for i in 1...4{
            MainNode.addChild(GameSceneButtons(buttonNum: i))
        }
        addChild(MainNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location=touches.first?.location(in: self)
        let backgroundLoaction=CGPoint(x: 0, y: 0)
        let excludedArea=CGRect(x: 0, y: 0, width: 479, height: 269)
        
        if(hasScheduleButton==false){
            if(!excludedArea.contains(location!)){
                let nodes=nodes(at: backgroundLoaction)
                for node in nodes {
                    if node.name=="Schedule_Button_Background"{
                        MainNode.addChild(GameSceneButtons(buttonNum: 1))
                        hasScheduleButton=true
                        node.removeFromParent()
                    }
                }
            }
        }
        else{
            let nodes=nodes(at: location!)
            for node in nodes {
                if node.name=="ScheduleButton"{
                    MainNode.addChild(GameSceneButtons(buttonNum: 5))
                    hasScheduleButton=false
                    node.removeFromParent()
                }
            }
        }
    }
}

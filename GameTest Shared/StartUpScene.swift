//
//  GameScene.swift
//  GameTest Shared
//
//  Created by H2026160 on 3/12/2024.
//

import SpriteKit

class StartUpScene: SKScene {
    
    //private let MainNode=SKNode()
    //private let ButtonNode=Button(buttonNum: 0)
    
    //fileprivate var label : SKLabelNode?
    //fileprivate var spinnyNode : SKShapeNode?

    
    class func newStartUpScene() -> StartUpScene {
        // Load 'GameScene.sks' as an SKScene.
        guard let scene = SKScene(fileNamed: "StartUpScene") as? StartUpScene else {
            print("Failed to load StartUpScene.sks")
            abort()
        }
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        return scene
    }
    
    override func didMove(to view: SKView) {
        //print("moved")
        //setUpButton()
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

extension StartUpScene{
    //func setUpButton(scene: SKScene){
        //for i in 0...9{
            //let ButtonNode=Button(buttonNum:i)
            //MainNode.addChild(ButtonNode)
            //addChild(MainNode)
            //MainNode.addChild(Button(buttonNum:i))
        //}
        //scene.addChild(MainNode)
    //}

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch==touches.first{
                let newScene = SKScene(fileNamed: "MenuScene")
                self.view?.presentScene(newScene)
                //setUpButton(scene: newScene!)
            }
        }
        print("touched")
        //let newScene = SKScene(fileNamed: "TestScene")
        //self.view?.presentScene(newScene)
    }
}

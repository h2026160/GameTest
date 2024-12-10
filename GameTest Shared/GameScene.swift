//
//  GameScene.swift
//  GameTest Shared
//
//  Created by H2026160 on 3/12/2024.
//

import SpriteKit

class GameScene: SKScene {
    
    private let MainNode=SKNode()
    //private let ButtonNode=Button(buttonNum: 0)
    
    //fileprivate var label : SKLabelNode?
    //fileprivate var spinnyNode : SKShapeNode?

    
    class func newGameScene() -> GameScene {
        // Load 'GameScene.sks' as an SKScene.
        guard let scene = SKScene(fileNamed: "GameScene") as? GameScene else {
            print("Failed to load GameScene.sks")
            abort()
        }
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        return scene
    }
    
    override func didMove(to view: SKView) {
        //print("moved")
        setUpButton()
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

extension GameScene{
    func setUpButton(scene: SKScene){
        for i in 0...9{
            //let ButtonNode=Button(buttonNum:i)
            //MainNode.addChild(ButtonNode)
            //addChild(MainNode)
            MainNode.addChild(Button(buttonNum:i))
        }
        scene.addChild(MainNode)
    }
}

extension GameScene{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch==touches.first{
                print("touched")
                let newScene = SKScene(fileNamed: "TestScene")
                self.view?.presentScene(newScene)
                setUpButton(scene: newScene!)
            }
        }
        //print("touched")
        //let newScene = SKScene(fileNamed: "TestScene")
        //self.view?.presentScene(newScene)
    }
}

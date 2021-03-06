//
//  GameScene.swift
//  RacingSimulator
//
//  Created by Tomas Peranic on 2021-04-22.
//

import SpriteKit
import GameplayKit

class StartScene: SKScene {
    
    var startButton: SKSpriteNode?
    var carScene:SKScene!
    
    override func didMove(to view: SKView) {
        startButton = self.childNode(withName: "StartButton") as? SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == startButton{
                let transition = SKTransition.fade(withDuration: 1)
                carScene = SKScene(fileNamed: "CarScene")
                carScene.scaleMode = .aspectFit
                self.view?.presentScene(carScene, transition: transition)
            }
        }
    }
    
}

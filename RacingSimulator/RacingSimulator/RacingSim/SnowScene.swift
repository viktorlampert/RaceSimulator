//
//  GameScene.swift
//  RacingSimulator
//
//  Created by Tomas Peranic on 2021-04-22.
//

import SpriteKit
import GameplayKit

class SnowScene: SKScene {
    
    var startButton: SKSpriteNode?
    var conditionScene:SKScene!
    
    override func didMove(to view: SKView) {
        startButton = self.childNode(withName: "StartButton") as? SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
}

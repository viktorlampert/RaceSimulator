//
//  GameScene.swift
//  RacingSimulator
//
//  Created by Tomas Peranic on 2021-04-22.
//

import SpriteKit
import GameplayKit

class ConditionScene: SKScene {
    
    var selectButton: SKSpriteNode?
    var normalButton: SKSpriteNode?
    var wetButton: SKSpriteNode?
    var snowButton: SKSpriteNode?
    var gameScene:SKScene!
    var snowScene:SKScene!
    var wetScene:SKScene!
    var conditionLabel: SKLabelNode?

    override func didMove(to view: SKView) {
        selectButton = self.childNode(withName: "SelectButton") as? SKSpriteNode
        conditionLabel = self.childNode(withName: "conditionSelected") as? SKLabelNode
        conditionLabel?.text = "Select a Condition"
        
    }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.previousLocation(in: self)
            let node = self.nodes(at: location).first
            
            if node?.name == "Normal"{
                conditionLabel?.text = "Sunny Condition"
            }
            else if node?.name == "Snow"{
                conditionLabel?.text = "Snow Condition"
            }
            else if node?.name == "Rain"{
                conditionLabel?.text = "Rain Condition"
            }
            
            if node == selectButton && conditionLabel?.text == "Sunny Condition"{
                let transition = SKTransition.fade(withDuration: 1)
                gameScene = SKScene(fileNamed: "GameScene")
                gameScene.scaleMode = .aspectFit
                self.view?.presentScene(gameScene, transition: transition)
            }
            else if node == selectButton && conditionLabel?.text == "Snow Condition"{
                let transition = SKTransition.fade(withDuration: 1)
                snowScene = SKScene(fileNamed: "SnowScene")
                snowScene.scaleMode = .aspectFit
                self.view?.presentScene(snowScene, transition: transition)
            }
            else if node == selectButton && conditionLabel?.text == "Rain Condition"{
                let transition = SKTransition.fade(withDuration: 1)
                wetScene = SKScene(fileNamed: "WetScene")
                wetScene.scaleMode = .aspectFit
                self.view?.presentScene(wetScene, transition: transition)
            }
            
        }
    }
}


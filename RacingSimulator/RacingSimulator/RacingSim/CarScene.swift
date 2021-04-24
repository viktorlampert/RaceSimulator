//
//  GameScene.swift
//  RacingSimulator
//
//  Created by Tomas Peranic on 2021-04-22.
//

import SpriteKit
import GameplayKit

class CarScene: SKScene {
    
    var selectButton: SKSpriteNode?
    var car1Button: SKSpriteNode?
    var car2Button: SKSpriteNode?
    var conditionScene:SKScene!
    var carLabel: SKLabelNode?
    
    override func didMove(to view: SKView) {
        selectButton = self.childNode(withName: "SelectButton") as? SKSpriteNode
        carLabel = self.childNode(withName: "carSelected") as? SKLabelNode
        carLabel?.text = "Select a Car"
    }
  
      override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          if let touch = touches.first{
              let location = touch.previousLocation(in: self)
              let node = self.nodes(at: location).first
              
              if node?.name == "Car1"{
                  carLabel?.text = "Coupe Selected"
                CarHandler.sharedInstances.car = "Car1"
              }
              else if node?.name == "Car2"{
                  carLabel?.text = "SUV Selected"
                CarHandler.sharedInstances.car = "Car2"
              }
              
              if node == selectButton && carLabel?.text == "Coupe Selected"{
                  let transition = SKTransition.fade(withDuration: 1)
                  conditionScene = SKScene(fileNamed: "ConditionScene")
                  conditionScene.scaleMode = .aspectFit
                  self.view?.presentScene(conditionScene, transition: transition)
              }
              else if node == selectButton && carLabel?.text == "SUV Selected"{
                  let transition = SKTransition.fade(withDuration: 1)
                  conditionScene = SKScene(fileNamed: "ConditionScene")
                  conditionScene.scaleMode = .aspectFit
                  self.view?.presentScene(conditionScene, transition: transition)
              }
          }
      }
}


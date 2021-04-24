//
//  GameScene.swift
//  RacingSimulator
//
//  Created by Viktor Lampert on 2021-04-22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var track:SKSpriteNode?
    let car = SKSpriteNode(imageNamed: "Car1")
    
    func createTrack(){
        track = self.childNode(withName: "NormalTrack") as? SKSpriteNode
    }
    
    override func didMove(to view: SKView) {
        self.addChild(car)
        car.position = CGPoint(x: 300, y: 200)
    }
 
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.previousLocation(in: self)
            let node = self.nodes(at: location).first
                        
            if node?.name == "Up"{
                moveForward()
            }else if node?.name == "Down"{
                moveBack()
            }else if node?.name == "Left"{
                moveLeft()
            }else if node?.name == "Right"{
                moveRight()
            }
        }
        
    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        car.removeAllActions()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        car.removeAllActions()
    }
    
    func moveForward(){
        //let moveAction = SKAction.move(to: CGPoint(x:car.position.x + cos(car.zRotation) * 1,y:car.position.y + sin(car.zRotation) * 1), duration: 0.01)
        let moveAction = SKAction.move(by: CGVector(dx:car.position.x + cos(car.zRotation) * 0.1,dy: car.position.y + sin(car.zRotation) * 0.1), duration: 2)
        let repeatAction = SKAction.repeatForever(moveAction)
        car.run(repeatAction)
    }
    
    func moveBack(){
        let moveAction = SKAction.move(by: CGVector(dx:-(car.position.x + cos(car.zRotation) * 0.1),dy:0), duration: 2)
        let repeatAction = SKAction.repeatForever(moveAction)
        car.run(repeatAction)
    }

    
    func moveLeft(){
        
    }

    
    func moveRight(){
        
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

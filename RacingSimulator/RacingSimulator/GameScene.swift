//
//  GameScene.swift
//  RacingSimulator
//
//  Created by Viktor Lampert on 2021-04-22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var track: SKSpriteNode?
    var coupe:SKSpriteNode?
    
    
    func createTrack(){
        track = self.childNode(withName: "NormalTrack") as? SKSpriteNode
    }
    
    func createCar(){
        coupe = SKSpriteNode(imageNamed: "Car1")
        guard let carPosition = track?.position.x else {return}
        coupe?.position = CGPoint(x: carPosition, y: self.size.height / 2)
        self.addChild(coupe!)
    }
    
    override func didMove(to view: SKView) {
        createTrack()
        createCar()
    }
    
    func moveVertically (up: Bool){
        if up{
            let moveAction = SKAction.moveBy(x: 0, y: 3, duration: 0.01)
            let repeatAction = SKAction.repeatForever(moveAction)
            coupe?.run(repeatAction)
        }else{
            let moveAction = SKAction.moveBy(x: 0, y: -3, duration: 0.01)
            let repeatAction = SKAction.repeatForever(moveAction)
            coupe?.run(repeatAction)
        }
        
    }
    
    func moveHorizontal (right: Bool){
        if right{
            let moveAction = SKAction.moveBy(x: 3, y: 0, duration: 0.01)
            let repeatAction = SKAction.repeatForever(moveAction)
            coupe?.run(repeatAction)
        }else{
            let moveAction = SKAction.moveBy(x: -3, y: 0, duration: 0.01)
            let repeatAction = SKAction.repeatForever(moveAction)
            coupe?.run(repeatAction)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.previousLocation(in: self)
            let node = self.nodes(at: location).first
            
            if node?.name == "Right"{
                moveHorizontal(right: true)
                print("Right")
            }
            if node?.name == "Left"{
                moveHorizontal(right: false)
                print("Left")
            }
            else if node?.name == "Up"{
                moveVertically(up: true)
                print("Up")
            }
            else if node?.name == "Down"{
                moveVertically(up: false)
                print("Down")
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        coupe?.removeAllActions()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        coupe?.removeAllActions()
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

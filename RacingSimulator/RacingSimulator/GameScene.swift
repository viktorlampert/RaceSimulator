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
    
    func moveForward (up: Bool){
        if up{
            let rotate = SKAction.rotate(byAngle: CGFloat(Double.pi/4), duration: 0.01)
            let repeatAction = SKAction.repeatForever(rotate)
            coupe?.run(repeatAction)
        }
        
    }
    
    func moveBackwards (down: Bool){
        if down{
            let rotate = SKAction.move(by: <#T##CGVector#>, duration: <#T##TimeInterval#>)
            let repeatAction = SKAction.repeatForever(rotate)
            coupe?.run(repeatAction)
        }
        
    }
    func turnLeft(left: Bool){
        if left{
            let rotate = SKAction.rotate(byAngle: CGFloat(Double.pi/60), duration: 0.01)
            let repeatAction = SKAction.repeatForever(rotate)
            coupe?.run(repeatAction)
        }
    }
    func turnRight (right: Bool){
        if right{
            let rotate = SKAction.rotate(byAngle: CGFloat(-Double.pi/60), duration: 0.01)
            let repeatAction = SKAction.repeatForever(rotate)
            coupe?.run(repeatAction)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.previousLocation(in: self)
            let node = self.nodes(at: location).first
            
            if node?.name == "Right"{
                turnRight(right: true)
                print("Right")
            }
            if node?.name == "Left"{
                turnLeft(left: true)
                print("Left")
            }
            else if node?.name == "Up"{
                moveForward(up: true)
                print("Up")
            }
            else if node?.name == "Down"{
                moveBackwards(down: true)
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

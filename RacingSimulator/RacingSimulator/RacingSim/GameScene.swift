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
    let car = SKSpriteNode(imageNamed: CarHandler.sharedInstances.car)
    var up:Bool = false
    var down:Bool = false
    var left:Bool = false
    var right:Bool = false
    
    func createTrack(){
        track = self.childNode(withName: "NormalTrack") as? SKSpriteNode
    }
    
    override func didMove(to view: SKView) {
        self.addChild(car)
        car.position = CGPoint(x: 340, y: 135)
        self.car.zPosition = 1.0
        car.size = CGSize(width: 35,height: 30)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.previousLocation(in: self)
            let node = self.nodes(at: location).first

            if node?.name == "Up"{
                up = true
            }else if node?.name == "Down"{
                down = true
            }else if node?.name == "Left"{
                left = true
            }else if node?.name == "Right"{
                right = true
            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        car.removeAllActions()
        up = false
        down = false
        left = false
        right = false
    }
    
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        car.removeAllActions()
//        up = false
//        down = false
//    }
    
//    func moveForward(){
//        let moveAction = SKAction.move(to: CGPoint(x:car.position.x + cos(car.zRotation) * 2,y:car.position.y + sin(car.zRotation) * 2), duration: 0.01)
//        let repeatAction = SKAction.repeatForever(moveAction)
//        car.run(repeatAction)
//    }
//
//    func moveBack(){
//        let moveAction = SKAction.move(to: CGPoint(x:car.position.x - cos(car.zRotation) * 2,y:car.position.y - sin(car.zRotation) * 2), duration: 0.01)
//        let repeatAction = SKAction.repeatForever(moveAction)
//        car.run(repeatAction)
//    }
//
//    func moveLeft(){
//        let rotate = SKAction.rotate(byAngle: CGFloat(Double.pi / 120), duration: 0.01)
//        let repeatAction = SKAction.repeatForever(rotate)
//        car.run(repeatAction)
//    }
//
//    func moveRight(){
//        let rotate = SKAction.rotate(byAngle: -(CGFloat(Double.pi / 120)), duration: 0.01)
//        let repeatAction = SKAction.repeatForever(rotate)
//        car.run(repeatAction)
//    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        car.physicsBody?.velocity = self.physicsBody!.velocity
        
        if up == true {
            car.physicsBody?.applyForce(CGVector(dx: car.position.x * cos(car.zRotation), dy:car.position.y * sin(car.zRotation)))
            //moveForward()
        }else if down == true{
   
        }else if left == true{
            car.physicsBody?.applyTorque(CGFloat(0.001))
        }else if right == true{
            car.physicsBody?.applyTorque(CGFloat(-0.001))
        }
    }
}

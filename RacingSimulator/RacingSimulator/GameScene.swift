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
    var coupe:SKSpriteNode?
    let ball = SKSpriteNode(imageNamed: "Stick")
    let base = SKSpriteNode(imageNamed: "Base")
    let car = SKSpriteNode(imageNamed: "Car1")
    var stickActive:Bool = false

    func createTrack(){
        track = self.childNode(withName: "NormalTrack") as? SKSpriteNode
    }
    
    override func didMove(to view: SKView) {
        
        self.addChild(base)
        base.position = CGPoint(x: 680, y: 50)
        
        self.addChild(ball)
        ball.position = base.position
        
        self.addChild(car)
        car.position = CGPoint(x: 300, y: 200)
    }
 
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches){
            let location = touch.location(in: self)
            
            if (ball.frame.contains(location)){
                stickActive = true
            }else{
                stickActive = false
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches){
            let location = touch.location(in: self)
            
            if (stickActive == true){
            
            let v = CGVector(dx: location.x - base.position.x, dy: location.y - base.position.y)
            let angle = atan2(v.dy, v.dx)
            
            let deg = angle * CGFloat(180 / Double.pi)
            print(deg + 180)
            
            let length:CGFloat = base.frame.size.height / 2
            
            let xDist:CGFloat = sin(angle - 1.57079633) * length
            let yDist:CGFloat = cos(angle - 1.57079633) * length
                        
            if (base.frame.contains(location)){
                ball.position = location
            }else{
                ball.position = CGPoint(x:base.position.x - xDist,y:base.position.y + yDist)
            }
            
            car.zRotation = angle - 1.57079633
            car.position = CGPoint(x: 300 - xDist, y: 200 + yDist)
            
    
            }
            
        }
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        if (stickActive == true){
            let move:SKAction = SKAction.move(to: base.position, duration: 0.2)
            move.timingMode = .easeOut
            ball.run(move)
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

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
    
    func setupTrack(){
        let track = self.childNode(withName: "normalTrack") as? SKSpriteNode
    }
    
    func createCar(){
        coupe = SKSpriteNode(imageNamed: "car1")
        guard let carPosition = track?.position.x else {return}
        coupe?.position = CGPoint(x: carPosition, y: self.size.height / 2)
        self.addChild(coupe!)
    }
    
    override func didMove(to view: SKView) {
        setupTrack()
        createCar()
    
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

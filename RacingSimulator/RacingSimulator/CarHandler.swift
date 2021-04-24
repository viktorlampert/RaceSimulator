//
//  CarHandler.swift
//  RacingSimulator
//
//  Created by Tomas Peranic on 2021-04-24.
//

import Foundation

class CarHandler{
    
    var car:String
    
    class var sharedInstances:CarHandler{
        struct Singleton{
            static let instance = CarHandler()
        }
        
        return Singleton.instance
    }
    
    init(){
        car = "Car1"
        
        let userDefaults = UserDefaults.standard
        car = userDefaults.string(forKey: "car") ?? "Car1"
    }
    
    func saveCarStats(){
        let userDefaults = UserDefaults.standard
        userDefaults.set(car, forKey: "car")
        userDefaults.synchronize()
    }
    
    
}

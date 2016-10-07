//
//  ViewController.swift
//  Firefly Example
//
//  Created by mac on 16/10/7.
//  Copyright © 2016年 hujewelz. All rights reserved.
//

import UIKit
import Firefly

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
     Firefly.fetchData(url: "http://lolsjlj.cjdzjj.com/lol_war/game/getGameMore?categoryId=1&userId=33") { result in
        
            guard let r = result?["result"] else {return}
            let model: [Model] =  (r  => Model.self)!
            print("model: \(model)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


   
}

class Model: NSObject {
    var gameName = ""
    //var state = 0
}

precedencegroup AdditionPrecedence {
    associativity: left
    //higherThan: LogicalAndPrecedence
}

infix operator =>: AdditionPrecedence

@discardableResult
func =><T: NSObject>(lhs: AnyObject, rhs: T.Type) -> T? {
    guard let dict = lhs as? [String: AnyObject] else {
        print("Can't convert \(lhs) to [String: AnyObject].")
        return nil
    }
    
    let model: T = dict.convertToModel()
    return model
}

@discardableResult
func =><T: NSObject>(lhs: AnyObject, rhs: T.Type) -> [T]? {
    
    guard let array = lhs as? [AnyObject] else {
        print("Can't convert \(lhs) to [AnyObject].")
        return nil
    }
    
    var models = [T]()
    array.forEach {
        let model: T = ($0 => rhs)!
        models.append(model)
    }
    
    return models
}

extension Dictionary {
    func convertToModel<T: NSObject>() -> T {
        let model = T()
        let mirror = Mirror(reflecting: model)
        
        mirror.children.forEach {
            print("item: \($0.0)")
            if let key = $0.0 as? Key, let value = self[key] {
                
                model.setValue(value as Any, forKey: $0.0!)
            }
        }
        
        return model
    }
}

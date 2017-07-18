//
//  ViewController.swift
//  Firefly
//
//  Created by huluobobo on 07/14/2017.
//  Copyright (c) 2017 huluobobo. All rights reserved.
//

import UIKit
import Firefly

class UserProdiver: Provider<User> {
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        test()
    }
    
    func test() {
        
//        Provider<User>().request(.users).JSONData { (response) in
//            guard let json = response.result.value else {
//                // show error UI
//                return
//            }
//
//            print(json)
//        }
        
        Provider<User>(.users).JSONData { (response) in
            
        }
        
//        UserProdiver(.users).JSONData { (response) in
//            
//        }.cancel()
    }

}

enum User: TargetType {
    case users
    
   // var baseURL: URL { return URL(string: "http://www.baidu.com")! }
    
    var path: String { return "/users" }
}

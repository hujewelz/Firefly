//
//  Firefly.swift
//  Firefly
//
//  Created by mac on 16/10/7.
//  Copyright © 2016年 hujewelz. All rights reserved.
//

import Foundation

public typealias ResultHandler = ([String: AnyObject]?) -> Void

open class Firefly {

    open static func fetchData(url: String,
                               method: HTTPMethod = .get,
                               parameters: [String: AnyObject]? = nil,
                               ResultHandler: @escaping ResultHandler) {
        
        request(url, method: method, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
            
            print("result: \($0.result.value)")
            
            ResultHandler($0.result.value as? [String: AnyObject])
            
        }
        
    }

}



/*func =><T: NSObject>(lhs: NSData, rhs: T.Type) -> T? {
    let model: T? = lhs.convertToModel()
    return model
}
 */


/*
extension Dictionary {
    
    func valueForKey(key: Key) -> Value? {
        guard let keyStr = key as? String, keyStr.contains(".") else {
            return self[key]
        }
        
        let keys = keyStr.components(separatedBy: ".")
        guard !keys.isEmpty else { return nil }
        
        
    }
}
 */

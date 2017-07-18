//
//  Logger.swift
//  Firefly_Example
//
//  Created by jewelz on 2017/7/18.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import Foundation
import Alamofire

struct Logger {
    
    static func logDebug(with request: Alamofire.Request, params: Parameters?) {
        #if DEBUG
            
            guard let httpRequest = request.request, let urlString = httpRequest.url?.absoluteString else {
                fatalError("url 错误.")
            }
            
            var log = "\n\n************************* Request Start **********************************\n"
            log.append("Http URL: \t\t\(urlString)\n")
            log.append("Method: \t\t\(String(describing: httpRequest.httpMethod ?? ""))\n")
            log.append("Params: \t\t\(String(describing: params))\n")
            
            let header = String(describing: httpRequest.allHTTPHeaderFields ?? [:])
            
            log.append("\nHeader: \n\t\(header)")
            if let httpBody = httpRequest.httpBody, let body = String(data: httpBody, encoding: .utf8)  {
                log.append("\nBody: \n\t\(body)")
            }
            
            log.append("\n\n************************* Request End **********************************\n\n")
            print(log)
        #endif
    }
}

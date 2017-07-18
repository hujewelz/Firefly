//
//  FireflyServer.swift
//  Firefly_Example
//
//  Created by jewelz on 2017/7/18.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import Foundation

public final class FireflyServer {
    public enum Environment: String {
        case development
        case production
    }
    
    public static let shared = FireflyServer()
    
    public var baseURL: URL? {
        let key = String(describing: "\(FireflyServer.self).\(currentEnvironment.rawValue)")
        return self.urlMap[key]
    }
    
    
    internal var enableLog: Bool {
        if currentEnvironment == .production {
            return false
        }
        
        return isLogEnable
    }
    
    private var isLogEnable = true
    
    private var currentEnvironment: FireflyServer.Environment = .development
    private var urlMap: [String: URL] = [:]
    
    public class func setCurrentEnvironment(_ env: FireflyServer.Environment) {
        FireflyServer.shared.currentEnvironment = env
    }
    
    public class func setBaseURL(_ baseURL: URL, for env: FireflyServer.Environment) {
        
        let key = String(describing: "\(FireflyServer.self).\(env.rawValue)")
        FireflyServer.shared.urlMap[key] = baseURL
    }
    
    public class func enableLog(_ able: Bool) {
        FireflyServer.shared.isLogEnable = able
    }
}

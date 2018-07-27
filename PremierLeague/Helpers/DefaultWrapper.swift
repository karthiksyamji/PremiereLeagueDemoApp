//
//  DefaultWrapper.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/26/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

import Foundation

class DefaultWrapper: NSObject {
    
    class func bearerToken() -> String {
        let token = UserDefaults.standard.value(forKey: APIKeys.bearerToken) as? String
        let accessToken = token ?? ""
        return accessToken
    }
    
    class func saveBearerToken(_ token: String){
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(token, forKey: APIKeys.bearerToken)
    }
}

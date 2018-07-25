//
//  Errors.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/25/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

import Foundation

//MARK:- Custom Errors

enum Errors: Error{
    case invalidResponse
    case customError(String)
}

extension Errors: LocalizedError{
    
    public var errorDescription: String?{
        
        switch self {
            
        case .invalidResponse:
            return "Invalid response from server"
            
        case .customError(let message):
            return message
            
        }
    }
}

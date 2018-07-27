//
//  APIRouter.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/26/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

import Foundation
import Alamofire

public enum APIRouter : URLRequestConvertible {
    
    case getBearerToken([String: Any])
    case getTweets([String: Any])
    
    var method : HTTPMethod {
        switch self {
        case .getBearerToken :
            return .post
            
        default:
            return .get
        }
    }
    
    
    var path: String{
        
        switch self {
        case .getBearerToken:
            return API.token
        case .getTweets:
            return API.search
        }
    }
    
    
    public func asURLRequest() throws -> URLRequest {
        
        let url = try TWITTER_TOKEN_URL.asURL()
        var fullURL = url.appendingPathComponent(path)
        
        let parameters : [String : Any]? = {
            switch  self {
                
            case .getBearerToken(let _):
                return nil
                
            case .getTweets(let body):
                fullURL = Utilities.urlString(url: fullURL, query: body)
                return nil
                
            default:
                return nil
            }
            
        }()
        
        var request = URLRequest(url: fullURL)
        
        switch self {
        case .getBearerToken :
            let params = APIKeys.tokenParams
            let postData = params.data(using: String.Encoding.ascii, allowLossyConversion: true)
            request.httpBody = postData
            request.setValue(APIKeys.authorization, forHTTPHeaderField: "Authorization")
            break
            
        default:
            // insert header parameters here
            request.setValue("Bearer " + DefaultWrapper.bearerToken(), forHTTPHeaderField: "Authorization")
        }
        
        request.httpMethod = method.rawValue
        request.setValue(APIKeys.jsonData, forHTTPHeaderField: "Content-Type")
        
        return try JSONEncoding.default.encode(request, with: parameters)
    }
}

//
//  APIConstants.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/26/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

let TWITTER_TOKEN_URL = "https://api.twitter.com/"


public struct API {
    
    static let token = "oauth2/token"
    static let search = "1.1/search/tweets.json"
}

public struct APIKeys{
    
    static let authorization = "Basic b0NRS1VjY0ptQXZZdXNWSHNtd1VwT2k2SDo0bWlWcndDYXJuRHpTQm1LOXZWSTh5WDB1eFVsZHlianMwZEl0WWRxSXl2RnB4bHFjYQ=="
    static let jsonData = "application/x-www-form-urlencoded"
    static let tokenParams = "grant_type=client_credentials"
    static let data = "data"
    static let status = "status"
    static let message = "message"
    
    static let tokenType = "token_type"
    static let bearerToken = "access_token"
    static let bearer = "bearer"
}

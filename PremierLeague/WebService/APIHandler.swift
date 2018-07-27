//
//  APIHandler.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/25/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

import UIKit
import Alamofire

class APIHandler: NSObject {
    
    //MARK:- Network Reachability
    func isConnectedToInternet() -> Bool {
        return (NetworkReachabilityManager()!.isReachable)
    }
    
    //MARK:- Universal Get
    public func get<T: Decodable>(_ fileName: String, responseType: T.Type, completion: @escaping (T?, Error?) -> Void) {
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let responseData = try Data(contentsOf: url)
                //                Decode Response into Base Response Model
                guard let baseResponse: T = try? JSONDecoder().decode(responseType, from: responseData) else {
                    completion(nil, Errors.invalidResponse)
                    return
                }
                completion(baseResponse,nil)
            } catch {
                completion(nil, error)
            }
        }
    }
    
    func getBearerToken(params: [String: String], completion: @escaping (_ error: Error?, _ response: [String: Any]?)->()){
        
        if self.isConnectedToInternet(){
            
            Alamofire.request(APIRouter.getBearerToken(params)).responseJSON(completionHandler: { (response) in
                self.completionFrom(response, completion: { (error, data) in
                    completion(error, data)
                })
            })
        }
        else{
            completion(Errors.invalidResponse, nil)
        }
    }
    
    func getTweets(params: [String: Any], completion: @escaping (_ error: Error?, _ response: [String: Any]?)->()){
        
        if self.isConnectedToInternet(){
            
            Alamofire.request(APIRouter.getTweets(params)).responseJSON(completionHandler: { (response) in
                self.completionFrom(response, completion: { (error, data) in
                    completion(error, data)
                })
            })
        }
        else{
            completion(Errors.invalidResponse, nil)
        }
    }

    private func completionFrom(_ response: (DataResponse<Any>), completion: @escaping (_ error: Error?, _ response: [String: Any]?)->()){
        
        guard response.result.isSuccess else {
            completion(response.error, nil)
            return
        }
        
        guard let responseJSON = response.result.value as? [String : Any] else {
            print("Invalid Response : " + String(describing: response.error))
            completion(response.error, nil)
            return
        }
        
//        guard let status = responseJSON[APIKeys.status] as? Int, let message = responseJSON[APIKeys.message] as? String else {
//            completion(response.error, nil)
//            return
//        }
//
//        if status == 0{
//            completion(Errors.invalidResponse, nil)
//            return
//        }
        
        completion(nil, responseJSON)
    }
    
}

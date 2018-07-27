//
//  TeamModuleDataManager.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/25/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

import Foundation


class TeamDataManager: NSObject {
    
    let apiHandler = APIHandler()
    var teamDetails: [TeamData]?
}

extension TeamDataManager {
    
    func getTeamList(_ completion: @escaping (Error?) -> ()) {
        
        apiHandler.get("TeamListData", responseType: TeamList.self) { (data, error) in
            if error != nil {
                completion(error)
                return
            }
            guard let teamList = data?.TeamListData else{
                completion(Errors.invalidResponse)
                return
            }
            self.teamDetails = teamList
            completion(nil)
        }
    }
    
    func getBearerToken(completion: @escaping (_ success: Bool, _ error: Error?) -> ()){
        
        var params = [String: String]()
        
        params["grant_type"] = "client_credentials"
        
        apiHandler.getBearerToken(params: params) { (error, response) in
            if let error = error{
                completion(false, error)
            }
            else{
                guard let data = response else{
                    completion(false, Errors.invalidResponse)
                    return
                }
                
                guard let tokenType = data[APIKeys.tokenType] as? String else {
                    return
                }
                
                if tokenType == APIKeys.bearer {
                    DefaultWrapper.saveBearerToken(data[APIKeys.bearerToken] as! String)
                }
                
                completion(true, nil)
            }
        }
        
    }
    
    func getTweets(param: String, completion: @escaping (_ tweets: [TweetData]?, _ error: Error?) -> ()){
        
        let params = searchParam(data: param)

        apiHandler.getTweets(params: params) { (error, response) in
            if let error = error{
                completion(nil, error)
            }
            else{
                guard let data = response else{
                    completion(nil, Errors.invalidResponse)
                    return
                }
                
                guard let tweetData = data["statuses"] as? [[String : Any]] else {
                    completion(nil, Errors.invalidResponse)
                    return
                }
                
                var tweetList = [TweetData]()
                
                
                for tweets in tweetData {
                    var tweet = TweetData()
                    tweet.tweet = tweets["text"] as? String
                    tweet.createdDate = Utilities.getDateFromString(dateString: (tweets["created_at"] as? String)!)
                    tweet.sortDate = Utilities.getFormattedDate(dateString: (tweets["created_at"] as? String)!)
                    tweetList.append(tweet)
                }
                tweetList.sort(by: {($0.sortDate?.timeIntervalSinceNow)! > ($1.sortDate?.timeIntervalSinceNow)!})
                completion(tweetList, nil)
            }
        }
        
    }
    
    func searchParam(data: String) -> [String: Any]{
        
        var dict = [String: Any]()
        dict["q"] = data
        return dict
        
    }
    
}

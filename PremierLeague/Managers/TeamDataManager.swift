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
}

//
//  Utilitites.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/26/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    
    class func urlString(url: URL, query: [String: Any]?) -> URL {
        var queryString = ""
        if query != nil {
            queryString = "?"
            for (key, value) in query! {
                queryString = queryString + "\(key)=\(value)"
                queryString = queryString + "&"
            }
            queryString.remove(at: queryString.index(before: queryString.endIndex))
        }
        let urlString = url.absoluteString + queryString
        let formattedUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let fullUrl = try! formattedUrl.asURL()
        return fullUrl
    }
    
    class func getDateFromString(dateString: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E MMM d HH:mm:ss Z yyyy"
        let date: Date? = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = "E, d MMM yyyy, HH:mm:ss"
        return dateFormatter.string(from: date!)
    }
    
    class func getFormattedDate(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E MMM d HH:mm:ss Z yyyy"
        guard let date = dateFormatter.date(from: dateString) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        return date
    }
}

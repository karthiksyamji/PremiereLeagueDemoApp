//
//  Extensions.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/25/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func showAlert(title: String = Texts.Titles.appName, _ message: String, actions: [UIAlertAction]?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        if let actions = actions{
            for action in actions {
                alertController.addAction(action)
            }
        }
        else {
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
        }
        present(alertController, animated: true, completion: nil)
    }
}

extension URL {
    
    @discardableResult
    func append(_ queryItem: String, value: String?) -> URL {
        
        guard var urlComponents = URLComponents(string:  absoluteString) else { return absoluteURL }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        guard let value = value else { return absoluteURL }
        let queryItem = URLQueryItem(name: queryItem, value: "%23" + value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems// queryItems?.append(item)
        return urlComponents.url!
    }
}


//extension URL {
//    
//    /**
//     Add, update, or remove a query string parameter from the URL
//     
//     - parameter url:   the URL
//     - parameter key:   the key of the query string parameter
//     - parameter value: the value to replace the query string parameter, nil will remove item
//     
//     - returns: the URL with the mutated query string
//     */
//    func appendingQueryItem(_ name: String, value: Any?) -> String {
//        guard var urlComponents = URLComponents(string: absoluteString) else {
//            return absoluteString
//        }
//        
//        urlComponents.queryItems = urlComponents.queryItems?
//            .filter { $0.name.lowercased() != name.lowercased() } ?? []
//        
//        // Skip if nil value
//        if let value = value {
//            urlComponents.queryItems?.append(URLQueryItem(name: name, value: "\(value)"))
//        }
//        
//        return urlComponents.string ?? absoluteString
//    }
//    
//    /**
//     Add, update, or remove a query string parameters from the URL
//     
//     - parameter url:   the URL
//     - parameter values: the dictionary of query string parameters to replace
//     
//     - returns: the URL with the mutated query string
//     */
//    func appendingQueryItems(_ contentsOf: [String: Any?]) -> String {
//        guard var urlComponents = URLComponents(string: absoluteString), !contentsOf.isEmpty else {
//            return absoluteString
//        }
//        
//        let keys = contentsOf.keys.map { $0.lowercased() }
//        
//        urlComponents.queryItems = urlComponents.queryItems?
//            .filter { !keys.contains($0.name.lowercased()) } ?? []
//        
//        urlComponents.queryItems?.append(contentsOf: contentsOf.flatMap {
//            guard let value = $0.value else { return nil } //Skip if nil
//            return URLQueryItem(name: $0.key, value: "\(value)")
//        })
//        
//        return urlComponents.string ?? absoluteString
//    }
//    
//    /**
//     Removes a query string parameter from the URL
//     
//     - parameter url:   the URL
//     - parameter key:   the key of the query string parameter
//     
//     - returns: the URL with the mutated query string
//     */
//    func removeQueryItem(_ name: String) -> String {
//        return appendingQueryItem(name, value: nil)
//    }
//}

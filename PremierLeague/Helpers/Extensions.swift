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

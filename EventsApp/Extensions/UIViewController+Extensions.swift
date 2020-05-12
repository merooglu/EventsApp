//
//  UIViewController+Extensions.swift
//  EventsApp
//
//  Created by Mehmet Eroğlu on 10.05.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static func instantiate<T>() -> T {
          let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyBoard.instantiateViewController(withIdentifier: "\(T.self)") as! T
          return controller
      }
    
}


//
//  EventCellViewModel.swift
//  EventsApp
//
//  Created by Mehmet Eroğlu on 13.05.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import UIKit

struct EventCellViewModel {
    
    var yearText: String {
        "1 year"
    }
    
    var monthText: String {
        "2 months"
    }
    
    var weekText: String {
        "2 weeks"
    }
    
    var dayText: String {
        "3 days"
    }
    
    var dateText: String {
        "25 Mar 2020"
    }
    
    var eventName: String {
        "Barbados"
    }
    
    var backgroundImage: UIImage {
        #imageLiteral(resourceName: "new_year")
    }
}

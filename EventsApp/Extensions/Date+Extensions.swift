//
//  Date+Extensions.swift
//  EventsApp
//
//  Created by Mehmet Eroğlu on 13.05.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import Foundation

extension Date {
    func timeRemaining(until endDate: Date) -> String? {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.year, .month, .weekOfMonth, .day]
        dateComponentsFormatter.unitsStyle = .full
        return dateComponentsFormatter.string(from: self, to: endDate)
    }
}

//
//  EventListViewModel.swift
//  EventsApp
//
//  Created by Mehmet Eroğlu on 10.05.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import Foundation

final class EventListViewModel {
    
    let title = "Events"
    var coordinator: EventListCoordinator?
    var onUpdate = {}
    
    enum Cell {
        case event(EventCellViewModel)
    }
    
    private(set) var cells: [Cell] = []
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager = CoreDataManager.shared) {
        self.coreDataManager = coreDataManager
    }
    
    func viewDidLoad() {
        reload()
    }
    
    func reload() {
        let events = coreDataManager.fetchEvents()
        
        cells = events.map {
            .event(EventCellViewModel($0))
        }
        onUpdate()
    }
    
    func tappedAddEvent() {
        coordinator?.startAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(at indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
}

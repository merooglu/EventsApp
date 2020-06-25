//
//  EventDetailCoordinator.swift
//  EventsApp
//
//  Created by Mehmet Eroğlu on 24.06.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import UIKit
import CoreData

final class EventDetailCoordinator: Coordinator {
    let childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    private let eventID: NSManagedObjectID
    var parentCoordinator: EventListCoordinator?
    init(
        eventID: NSManagedObjectID,
        navigationController: UINavigationController
    ) {
        self.eventID = eventID
        self.navigationController = navigationController
    }
    
    func start() {
        let eventDetailViewController: EventDetailViewController = .instantiate()
        let eventDetailViewModel = EventDetailViewModel(eventID: eventID)
        eventDetailViewModel.coordinator = self
        eventDetailViewController.viewModel = eventDetailViewModel
        navigationController.pushViewController(eventDetailViewController, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("detail coordinator deinit")
    }
}

//
//  EditEventCoordinator.swift
//  EventsApp
//
//  Created by Mehmet Eroğlu on 25.06.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import UIKit

protocol EventUpdatingCoordinator {
    var onUpdateEvent: () -> Void { get }
}

final class EditEventCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    private let event: Event
    private var completion: (UIImage) -> Void = { _ in }
    
    var parentCoordinator: (EventDetailCoordinator & Coordinator)?
    
    init(event: Event, navigationController: UINavigationController) {
        self.event = event
        self.navigationController = navigationController
    }
    
    
    func start() {
        let editEventViewController: EditEventViewController = .instantiate()
        let editEventViewModel = EditEventViewModel(event: event, cellBuilder: EventsCellBuilder())
        editEventViewModel.coordinator = self    
        editEventViewController.viewModel = editEventViewModel
        navigationController.pushViewController(editEventViewController, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func didFinishUpdateEvent() {
        parentCoordinator?.onUpdateEvent()
        navigationController.popViewController(animated: true)
    }
    
    func showImagePicker(completion: @escaping (UIImage) -> Void) {
        self.completion = completion
        let imagePickerCoordinator = ImagePickerCoordinator(navigationCoordinator: navigationController)
        imagePickerCoordinator.parentCoordinator = self
        imagePickerCoordinator.onFinishPicking = { image in
            completion(image)
            self.navigationController.dismiss(animated: true, completion: nil)
        }
        childCoordinators.append(imagePickerCoordinator)
        imagePickerCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}


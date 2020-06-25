//
//  ImagePickerCoordinator.swift
//  EventsApp
//
//  Created by Mehmet Eroğlu on 12.05.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import UIKit

final class ImagePickerCoordinator: NSObject, Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationCoordinator: UINavigationController
    var parentCoordinator: Coordinator?
    var onFinishPicking: (UIImage) -> Void = { _ in }
    
    init(navigationCoordinator: UINavigationController) {
        self.navigationCoordinator = navigationCoordinator
    }
    
    func start() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        navigationCoordinator.present(imagePickerController, animated: true, completion: nil)
    }
    
}

extension ImagePickerCoordinator: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            onFinishPicking(image)
        }
        parentCoordinator?.childDidFinish(self)
    }
}

//
//  EventListViewController.swift
//  EventsApp
//
//  Created by Mehmet Eroğlu on 10.05.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController {
    
    
    static func instantiate() -> EventListViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyBoard.instantiateViewController(withIdentifier: "EventListViewController") as! EventListViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedRightBarButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = "Events"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedRightBarButton() {
        print("right button tapped")
    }
    
}

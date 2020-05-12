//
//  AddEventViewModel.swift
//  EventsApp
//
//  Created by Mehmet Eroğlu on 10.05.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import UIKit

final class AddEventViewModel {
    
    let title = "Add"
    var onUpdate: () -> Void = {}
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
    }
    
    private(set) var cells: [AddEventViewModel.Cell] = []
    var coordinator: AddEventCoordinator?
    
    func viewDidLoad() {
        cells = [
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add a name", type: .text, onCellUpdate: {})),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeholder: "Select a date", type: .date, onCellUpdate: { [weak self] in
                self?.onUpdate()
            })),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Background", subtitle: "", placeholder: "", type: .image, onCellUpdate: { [weak self] in
                self?.onUpdate()
            }))
        ]
        onUpdate()
    }
    
    func viewDidDisapper() {
        coordinator?.didFinishAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cells(for indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
    func tappedDone() {
        print("Done toapp")
    }
    
    func updateCell(indexPath: IndexPath, subtitle: String) {
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            titleSubtitleCellViewModel.update(subtitle)
        }
    }
}

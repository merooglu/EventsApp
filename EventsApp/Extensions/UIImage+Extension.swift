//
//  UIImage+Extension.swift
//  EventsApp
//
//  Created by Mehmet Eroğlu on 24.06.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import UIKit

extension UIImage {
    func sameAspectRatio(newHeight: CGFloat) -> UIImage {
        let scale = newHeight / size.height
        let newWidth = size.width * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        return UIGraphicsImageRenderer(size: newSize).image { _ in
            self.draw(in: .init(origin: .zero, size: newSize))
        }
    }
}

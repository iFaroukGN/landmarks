//
//  UIImageView+roundCorners.swift
//  landmark
//
//  Created by Farouk GN on 16/08/2018.
//  Copyright © 2018 Farouk GN. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}

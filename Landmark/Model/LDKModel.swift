//
//  LDKModel.swift
//  landmark
//
//  Created by Farouk GN on 16/08/2018.
//  Copyright © 2018 Farouk GN. All rights reserved.
//

import Foundation
import UIKit

class LDKModel {
    
    var name: String?
    
    var image: UIImage?
    
    init(landmarkName:String, landmarkImage:UIImage) {
        
        name = landmarkName
        
        image = landmarkImage
        
    }
}

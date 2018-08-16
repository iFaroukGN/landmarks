//
//  LDKTableViewCell.swift
//  landmark
//
//  Created by Farouk GN on 16/08/2018.
//  Copyright © 2018 Farouk GN. All rights reserved.
//

import Foundation
import UIKit

class LDKTableViewCell: UICollectionViewCell {
    
    
    private let  label: UILabel!
    private let imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel()
//        label.
        
        imageView = UIImageView()
        imageView.clipsToBounds = true
        
        contentView.addSubview(label)
        contentView.addSubview(imageView)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var reuseIdentifier : String{
        return String(describing: self)
    }
}

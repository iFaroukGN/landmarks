//
//  LDKCollectionViewCell.swift
//  landmark
//
//  Created by Farouk GN on 16/08/2018.
//  Copyright © 2018 Farouk GN. All rights reserved.
//

import Foundation
import UIKit

class LDKCollectionViewCell: UICollectionViewCell {
    
    
    private var  label: UILabel!
    private var imageView: UIImageView!
    
    var landmark: LDKModel? {
        didSet {
            showLandmark()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.width/2))
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
       
        
        label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: contentView.bounds.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: (contentView.bounds.width/1.5) ).isActive = true
        
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func showLandmark() {
        
        label.text = landmark?.name
        
        imageView.image = landmark?.image
        
    }
    
    static var reuseIdentifier : String{
        return String(describing: self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.roundCorners([.topRight, .topLeft], radius: 10)
    }
}

//
//  StoriesCollectionViewCell.swift
//  VumonicTask2.0
//
//  Created by Suresh Swaminathan on 01/06/21.
//

import UIKit
class StoriesCollectionViewCell: UICollectionViewCell {
    static let identifier = "CircleCollectionViewCell"
    
    //create storiy image view and setting
    private let myImageView: UIImageView =  {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 60/2.0
        imageView.backgroundColor = .blue
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor =  UIColor.link.cgColor
        return imageView
    }()
    //create storiy label and setting
    private let namelbl = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView) // add subview - imageview
        contentView.addSubview(namelbl) // add subview -label
        namelbl.translatesAutoresizingMaskIntoConstraints  = false // set contraint label
        namelbl.topAnchor.constraint(equalTo: myImageView.bottomAnchor).isActive = true
        namelbl.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = contentView.bounds // layoutsubview
        namelbl.frame = contentView.bounds
    }
    public func configure(with name: String ){ // image and text processing
        myImageView.image = UIImage(named: name)
        namelbl.text = "Your Stories"
        namelbl.font = namelbl.font.withSize(10)
    }
}


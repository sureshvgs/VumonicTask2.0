//
//  HomePostCellHearder.swift
//  VumonicTask2.0
//
//  Created by Suresh Swaminathan on 01/06/21.
//


import UIKit
class HomePostCellHeader: UIView {
   /* struct Cells {
        static let feedCell = "feedcell"
    }*/
 private var padding: CGFloat = 8
    // create  profile picture view and setting
    private let userProfileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "user")
        iv.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        iv.layer.borderWidth = 0.5
        iv.isUserInteractionEnabled  = true
        return iv
    }()
    // create  username Button and setting
    private let usernameButton: UIButton = {
        let label = UIButton(type: .system)
        label.setTitleColor(.black, for: .normal)
        label.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        label.contentHorizontalAlignment = .left
        
        return label
    }()
    // create  option button and setting
    private let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("•••", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() { // hearder view.  set constraints profile image ,username and option button 
        addSubview(userProfileImageView)
        
        userProfileImageView.translatesAutoresizingMaskIntoConstraints                               = false
        userProfileImageView.topAnchor.constraint(equalTo:topAnchor).isActive = true
        userProfileImageView.leftAnchor.constraint(equalTo: leftAnchor,constant: padding).isActive = true
        userProfileImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        userProfileImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        userProfileImageView.layer.cornerRadius = 60 / 2
        
        addSubview(optionsButton)
        optionsButton.translatesAutoresizingMaskIntoConstraints                               = false
        optionsButton.topAnchor.constraint(equalTo:topAnchor).isActive = true
        optionsButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        optionsButton.rightAnchor.constraint(equalTo: rightAnchor,constant: padding).isActive = true
        optionsButton.widthAnchor.constraint(equalToConstant: 66).isActive = true
        
        addSubview(usernameButton)
        usernameButton.translatesAutoresizingMaskIntoConstraints                               = false
        usernameButton.topAnchor.constraint(equalTo: topAnchor,constant: padding+5).isActive = true
        usernameButton.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor ,constant: 8).isActive = true
    }
    func setheaderdata(user : User) {
        usernameButton.setTitle(user.username, for: .normal)
        userProfileImageView.image = UIImage(named: user.profileImageUrl)
        
    }
    
}




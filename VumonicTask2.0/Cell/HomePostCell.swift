//
//  HomePostCell.swift
//  VumonicTask2.0
//
//  Created by Suresh Swaminathan on 01/06/21.
//

import UIKit

class HomePostCell: UITableViewCell {

    let header = HomePostCellHeader()
    let captionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let padding: CGFloat = 12
    private let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return iv
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "like_selected"), for: .normal)
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "comment"), for: .normal)
        return button
    }()
    
    private let sendMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "send2"), for: .normal)
        return button
    }()
    
    private let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "ribbon")
        button.setImage( image, for: .normal)
        return button
    }()
    
    private let likeCounter: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:reuseIdentifier)
        sharedInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.topAnchor.constraint(equalTo:topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        
        addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints  = false
        photoImageView.topAnchor.constraint(equalTo: header.bottomAnchor,constant: 35).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        photoImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        photoImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        setupActionButtons()
        
        addSubview(likeCounter)
        likeCounter.translatesAutoresizingMaskIntoConstraints = false
        likeCounter.topAnchor.constraint(equalTo:likeButton.bottomAnchor).isActive = true
        likeCounter.leftAnchor.constraint(equalTo: leftAnchor,constant: padding).isActive = true
        
        addSubview(captionLabel)
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.topAnchor.constraint(equalTo:likeCounter.bottomAnchor).isActive = true
        captionLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: padding-4).isActive = true
        captionLabel.rightAnchor.constraint(equalTo: rightAnchor,constant: padding).isActive = true
    }
    func setupActionButtons() {
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, sendMessageButton])
        stackView.distribution = .fillEqually
        stackView.alignment = .top
        stackView.spacing = 16
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints  = false
        stackView.topAnchor.constraint(equalTo:photoImageView.bottomAnchor,constant: padding-5).isActive = true
        stackView.leftAnchor.constraint(equalTo:leftAnchor,constant: padding).isActive = true
        stackView.bottomAnchor.constraint(equalTo:bottomAnchor,constant: padding).isActive = true
        addSubview(bookmarkButton)
        bookmarkButton.translatesAutoresizingMaskIntoConstraints   = false
        bookmarkButton.topAnchor.constraint(equalTo:photoImageView.bottomAnchor,constant: 12).isActive = true
        bookmarkButton.rightAnchor.constraint(equalTo: rightAnchor,constant: -12).isActive = true
    }
    func setdata(post : Post) {
        header.setheaderdata(user: post.user)
        photoImageView.image = UIImage(named: post.imageUrl)
        likeButton.setImage(#imageLiteral(resourceName: "like_selected").withRenderingMode(.alwaysOriginal), for: .normal)
        setLikes(to: 100)
        let attributedText = NSMutableAttributedString(string: post.caption, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "\(post.user.username)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
        attributedText.append(NSAttributedString(string: "\n\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 4)]))
        let timeAgoDisplay = "3 days ago"
        attributedText.append(NSAttributedString(string: timeAgoDisplay, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        captionLabel.attributedText = attributedText
    }

   private func setLikes(to value: Int) {
        if value <= 0 {
            likeCounter.text = ""
        } else if value == 1 {
            likeCounter.text = "1 like"
        } else {
            likeCounter.text = "\(value) likes"
        }
    }
}


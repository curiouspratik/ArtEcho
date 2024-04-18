//
//  FavouritesTableViewCell.swift
//  ArtEcho
//
//  Created by Pratik Ashok Patil on 05/04/24.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelPrompt: UILabel!
    var labelAnswer: UILabel!
    var imagePhoto: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelPrompt()
        setupLabelAnswer()
        setupImagePhoto()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelPrompt(){
        labelPrompt = UILabel()
        labelPrompt.font = UIFont.boldSystemFont(ofSize: 20)
        labelPrompt.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPrompt)
    }
    
    func setupLabelAnswer(){
        labelAnswer = UILabel()
        labelAnswer.font = UIFont.boldSystemFont(ofSize: 14)
        labelAnswer.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelAnswer)
    }
    
    func setupImagePhoto(){
        imagePhoto = UIImageView()
        imagePhoto.image = UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal)
        imagePhoto.contentMode = .scaleAspectFit
        imagePhoto.clipsToBounds = true
        imagePhoto.layer.masksToBounds = true
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imagePhoto)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            imagePhoto.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 10),
            imagePhoto.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            imagePhoto.heightAnchor.constraint(equalToConstant: 80),
            imagePhoto.widthAnchor.constraint(equalToConstant: 80),
            
            labelPrompt.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelPrompt.leadingAnchor.constraint(equalTo: imagePhoto.trailingAnchor, constant: 16),
            labelPrompt.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -20),
            labelPrompt.heightAnchor.constraint(equalToConstant: 20),
            
            labelAnswer.topAnchor.constraint(equalTo: labelPrompt.bottomAnchor, constant: 2),
            labelAnswer.leadingAnchor.constraint(equalTo: labelPrompt.leadingAnchor),
            labelAnswer.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -20),
            labelAnswer.heightAnchor.constraint(equalToConstant: 16),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


//
//  AppCell.swift
//  proto-appstore-mock-ios
//
//  Created by Santosh Krishnamurthy on 3/30/23.
//

import UIKit

class AppCell: UICollectionViewCell {
    
    
    var appCellViewModel: AppViewModelType? {
        didSet{
            print("App cell view Model set")
            guard let appCellViewModel else {return}
            appTitleLabel.text = appCellViewModel.name
            appCategoryLabel.text = appCellViewModel.category
            appIconImageView.image = UIImage(named: appCellViewModel.iconImageName)
            appCostLabel.text = "$\(appCellViewModel.price)"
        }
    }
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "confused"))
        iv.backgroundColor = .yellow
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 16.0
        return iv
    }()
    
    let appTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .darkGray
        label.text = "Get Happy. This will calm your mind!"
        label.numberOfLines = 2
        return label
    }()
    
    let appCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        label.text = "Welness"
        return label
    }()
    
    let appCostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        label.text = "$ 0.99"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() -> Void {
        backgroundColor = .green
        addSubview(appIconImageView)
        addSubview(appTitleLabel)
        addSubview(appCategoryLabel)
        addSubview(appCostLabel)
    }
    
    private func setupLayout(){
        appIconImageView.translatesAutoresizingMaskIntoConstraints = false
        appIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        appIconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        appIconImageView.widthAnchor.constraint(equalTo: widthAnchor, constant: -16.0).isActive = true
        appIconImageView.heightAnchor.constraint(equalTo: appIconImageView.widthAnchor, multiplier: 1).isActive = true
        
        appTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        appTitleLabel.topAnchor.constraint(equalTo: appIconImageView.bottomAnchor, constant: 2).isActive = true
        appTitleLabel.leadingAnchor.constraint(equalTo: appIconImageView.leadingAnchor, constant: 0).isActive = true
        appTitleLabel.trailingAnchor.constraint(equalTo: appIconImageView.trailingAnchor, constant: 0).isActive = true
        // appTitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        appCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        appCategoryLabel.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor, constant: 2).isActive = true
        appCategoryLabel.leadingAnchor.constraint(equalTo: appIconImageView.leadingAnchor, constant: 0).isActive = true
        appCategoryLabel.trailingAnchor.constraint(equalTo: appIconImageView.trailingAnchor, constant: 0).isActive = true
        
        appCostLabel.translatesAutoresizingMaskIntoConstraints = false
        appCostLabel.topAnchor.constraint(equalTo: appCategoryLabel.bottomAnchor, constant: 2).isActive = true
        appCostLabel.leadingAnchor.constraint(equalTo: appIconImageView.leadingAnchor, constant: 0).isActive = true
        appCostLabel.trailingAnchor.constraint(equalTo: appIconImageView.trailingAnchor, constant: 0).isActive = true

        
    }
}

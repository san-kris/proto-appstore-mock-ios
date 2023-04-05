//
//  AppDetailHeader.swift
//  proto-appstore-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/5/23.
//

import UIKit

// create a header cell
class AppDetailHeader: UICollectionViewCell {
    
    var app: AppViewModelType?{
        didSet{
            print("App info available in header")
            guard let app else {return}
            appTitle.text = app.name
            iconImageView.image = UIImage(named: app.iconImageName)
        }
    }
    
    let iconImageView:  UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Background-Euro")
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 16
        return iv
    }()
    
    let appTitle: UILabel = {
        let label = UILabel()
        label.text = "App Name Here"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.backgroundColor = .green
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let appDescription: UILabel = {
        let label = UILabel()
        label.text = "App Description goes here"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.numberOfLines = 0
        label.backgroundColor = .orange
        return label
    }()
    
    lazy var buyButton : UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Buy", for: UIControl.State.normal)
        // button.backgroundColor = .blue
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleBuy), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    lazy var buyStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [UIView(), buyButton])
        sv.axis = .horizontal
        return sv
    }()
    
    lazy var headerTitleTextStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [appTitle, appDescription, UIView(), buyStackView])
        sv.axis = .vertical
        return sv
    }()
    
    lazy var headerAppInfoStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [iconImageView, headerTitleTextStack])
        sv.axis = .horizontal
        sv.spacing = 10
        return sv
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Details", "Review", "Related"])
        sc.tintColor = .darkGray
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegmentSelection), for: UIControl.Event.valueChanged)
        return sc
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    lazy var headerVerticalStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [headerAppInfoStack, UIView(),segmentedControl, dividerLineView])
        sv.axis = .vertical
        sv.spacing = 10
        // sv.distribution = .
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() -> Void {
        backgroundColor = .yellow
        
        addSubview(headerVerticalStack)

        setupLayout()
    }
    
    func setupLayout() -> Void {
        headerVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        headerVerticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        headerVerticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        headerVerticalStack.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        headerVerticalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor, multiplier: 1).isActive = true

        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        dividerLineView.translatesAutoresizingMaskIntoConstraints = false
        dividerLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    @objc private func handleSegmentSelection(sender: UISegmentedControl) -> Void {
        print("Segment selected \(sender.selectedSegmentIndex)")
    }
    
    @objc private func handleBuy(sender: UIButton) -> Void{
        print("Buy button selected")
    }
    
}

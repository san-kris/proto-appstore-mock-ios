//
//  AppDetailScreenshotCell.swift
//  proto-appstore-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/5/23.
//

import UIKit

class AppDetailScreenshotCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let screenshotCellID = "screenshotCellID"
    
    lazy var screenshotCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        let layout = cv.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        cv.backgroundColor = .gray
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: screenshotCellID)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() -> Void {
        // All add subviews
        addSubview(screenshotCollectionView)
        
        // setup layout of subviews
        setupLayout()
    }
    
    func setupLayout() -> Void {
        screenshotCollectionView.translatesAutoresizingMaskIntoConstraints = false
        screenshotCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        screenshotCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        screenshotCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        screenshotCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotCellID, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: Try to scroll the cell to center
        print("Screenshot selected: \(indexPath.item)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: frame.height)
    }
    
    
    
}

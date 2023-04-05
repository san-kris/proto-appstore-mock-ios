//
//  AppDetailViewController.swift
//  proto-appstore-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/3/23.
//

import UIKit

class AppDetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let appDetailHeaderCell = "appDetailHeaderCell"
    let appDetailCell = "appDetailCell"
    
    var app: AppViewModelType?{
        didSet{
            guard let app else {return}
            navigationItem.title = app.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.alwaysBounceVertical = true

        // Do any additional setup after loading the view.
        collectionView.register(AppDetailScreenshotCell.self, forCellWithReuseIdentifier: appDetailCell)
        collectionView.register(AppDetailHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: appDetailHeaderCell)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appDetailCell, for: indexPath) as! AppDetailScreenshotCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: appDetailHeaderCell, for: indexPath) as! AppDetailHeader
        cell.app = app
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)

    }
    
    // need this when view will transition to landscape and back
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        // invalidate layout when transitioning to landscape / portrait
        // if not done, ioos will try to draw ui with landscape coordinates on a portrait frame
        collectionView.collectionViewLayout.invalidateLayout()
    }

}


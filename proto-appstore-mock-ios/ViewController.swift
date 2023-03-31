//
//  ViewController.swift
//  proto-appstore-mock-ios
//
//  Created by Santosh Krishnamurthy on 3/30/23.
//

import UIKit

class ViewController: UICollectionViewController {
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellID)

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CategoryCell
        return cell
    }
    
    
    // called when screen orientation is changed
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        // invalidate layout to redraw UI with new frame size
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func setupNavigationBar() -> Void{
        navigationItem.title = "Featured"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // this is not called becaue the cell is covered with a collection view
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Row selected \(indexPath.section) ; \(indexPath.row) \(indexPath.item)")
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}


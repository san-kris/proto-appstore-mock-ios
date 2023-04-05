//
//  ViewController.swift
//  proto-appstore-mock-ios
//
//  Created by Santosh Krishnamurthy on 3/30/23.
//

import UIKit

class ViewController: UICollectionViewController {
    
    let cellID = "cellID"
    
    // you will receive class has no init error if you declare a optioonal as let
    var appCategories: [AppCategoryViewModelType]? {
        didSet{
            print("Did set App Categories View Model in VC")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        
        // Do any additional setup after loading the view.
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellID)

    }
    
    fileprivate func setupViewModel() {
        let model = MockAppData.makeDummyModelData()
        appCategories = model.map({ (category) in
            AppStoreCategoryViewModel(category: category)
        })
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let appCategories{
            return appCategories.count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CategoryCell
        if let categoryViewModel = appCategories?[indexPath.row]{
            cell.appCategoryViewModel = categoryViewModel
            cell.categoryListViewController = self
        }
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
    
    func showAppDetailsForApp(app: AppViewModelType) -> Void {
        let appDetailsController = AppDetailViewController(collectionViewLayout: UICollectionViewFlowLayout())
        appDetailsController.app = app
        navigationController?.pushViewController(appDetailsController, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}


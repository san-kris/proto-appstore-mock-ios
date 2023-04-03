//
//  CategoryCell.swift
//  proto-appstore-mock-ios
//
//  Created by Santosh Krishnamurthy on 3/30/23.
//

import UIKit

class CategoryCell: UICollectionViewCell{

    // name of the cell used
    let appCellID = "appCellId"
    
    var appCategoryViewModel: AppCategoryViewModelType? {
        didSet{
            categoryLabel.text = appCategoryViewModel?.name
        }
    }
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.text = "Best New Apps"
        return label
    }()
    
    lazy var categoryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .red
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        collectionView.register(AppCell.self, forCellWithReuseIdentifier: appCellID)
        return collectionView
    }()
    
    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() -> Void {
        backgroundColor = .black
        addSubview(categoryLabel)
        addSubview(categoryCollectionView)
        addSubview(dividerLine)
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
    }
    
    func setupLayout() -> Void {
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoryCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        categoryCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        categoryCollectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 0).isActive = true
        categoryCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        dividerLine.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 0).isActive = true
        dividerLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        dividerLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
    
}

extension CategoryCell: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let appCategoryViewModel{
            return appCategoryViewModel.apps.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appCellID, for: indexPath) as! AppCell
        cell.appCellViewModel = appCategoryViewModel?.apps[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }

}

extension CategoryCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 37)
    }

}

extension CategoryCell: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell selected: \(indexPath.section); \(indexPath.row); \(indexPath.item)")
    }
}

//
//  AppStoreCategoryViewModel.swift
//  proto-appstore-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/2/23.
//

import Foundation

struct AppStoreCategoryViewModel: AppCategoryViewModelType{
    var name: String = ""
    var apps: [AppViewModelType] = [AppViewModelType]()

    var categoryModel: AppCategoryModel? {
        didSet{
            print("Setting up category View Model")
            guard let categoryModel else {return}
            name = categoryModel.name
            apps = categoryModel.apps.map({ (app) in
                AppStoreAppViewModel(app: app)
            })
        }
    }
    
    
    init (category: AppCategoryModel){
        // Observer methods Did set and Will set wont be called when value is set from init
        // you have to set using defered{} command to make the assignment outside of init
        defer {categoryModel = category}
        
    }
    
    
}

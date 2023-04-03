//
//  AppStoreAppViewModel.swift
//  proto-appstore-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/2/23.
//

import Foundation


struct AppStoreAppViewModel: AppViewModelType{

    var id: Int = -1
    var name: String = ""
    var category: String = ""
    var iconImageName: String = ""
    var price: Float = 0.0

    var appModel: AppModel? {
        didSet {
            guard let appModel else {return}
            id = appModel.id
            name = appModel.name
            category = appModel.category
            iconImageName = appModel.iconImageName
            price = appModel.price
        }
    }    
    
    init(app: AppModel){
        defer {appModel = app}
    }
    
}

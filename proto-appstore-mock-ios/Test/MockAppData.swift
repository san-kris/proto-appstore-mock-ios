//
//  MockAppData.swift
//  proto-appstore-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/1/23.
//

import Foundation

class MockAppData{
    static func makeDummyModelData() -> [AppCategoryModel] {
        var apps = [AppModel]()
        var appCategories = [AppCategoryModel]()
        
        apps = []
        apps.append( AppModel(id: 1, name: "Happy", category: "Health", iconImageName: "confused", price: 0.99) )
        apps.append( AppModel(id: 2, name: "Heart Health", category: "Health", iconImageName: "icons8-heart-suit-96", price: 0.0))
        appCategories.append(AppCategoryModel(name: "Health", apps: apps))
        
        apps = []
        apps.append( AppModel(id: 1, name: "Football", category: "Sport", iconImageName: "icons8-american-football-96", price: 0.99) )
        apps.append( AppModel(id: 2, name: "Party Supplies", category: "Sport", iconImageName: "icons8-party-popper-96", price: 0.0))
        appCategories.append(AppCategoryModel(name: "Sport", apps: apps))
        
        return appCategories
    }
}

//
//  AppCategoryViewModel.swift
//  proto-appstore-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/1/23.
//

import Foundation

protocol AppCategoryViewModelType{
    var name: String {get}
    var apps: [AppViewModelType] {get}
}

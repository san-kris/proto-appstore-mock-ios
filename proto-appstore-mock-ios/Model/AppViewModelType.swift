//
//  AppViewModel.swift
//  proto-appstore-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/1/23.
//

import Foundation

protocol AppViewModelType{
    var id: Int {get}
    var name: String {get}
    var category: String {get}
    var iconImageName: String {get}
    var price: Float {get}
}

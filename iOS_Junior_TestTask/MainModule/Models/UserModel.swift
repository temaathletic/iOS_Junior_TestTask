//
//  UserModel.swift
//  iOS_Junior_TestTask
//
//  Created by temaathletic on 08.11.2022.
//

import Foundation

struct UserModel {
    var firstName = ""
    var secondName = ""
    var thirdName = ""
    var birthsday = ""
    var gender = ""
    
    static func == (_ firstModel: UserModel, _ secondModel: UserModel) -> Bool {
        firstModel.firstName == secondModel.firstName &&
        firstModel.secondName == secondModel.secondName &&
        firstModel.thirdName == secondModel.thirdName &&
        firstModel.birthsday == secondModel.birthsday &&
        firstModel.gender == secondModel.gender
    }
}

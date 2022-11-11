//
//  UsserDefaultHelper.swift
//  iOS_Junior_TestTask
//
//  Created by temaathletic on 08.11.2022.
//

import UIKit


final class UserDefaultsHelper {
    
    private static let defaults = UserDefaults.standard
    private static let userSessionKey = "userKey"
    
    
    static func getUserDictionary() -> [String: String] {
        defaults.value(forKey: userSessionKey) as? [String : String] ?? [:]
    }
    
    static func saveUserValue(_ key: String, value: String) {
        var userDictionary = getUserDictionary()
        userDictionary[key] = value
        defaults.set(userDictionary, forKey: userSessionKey)
    }
    
    static func getUserModel() -> UserModel {
        var userModel = UserModel()
        let userDictionary = getUserDictionary()
        userModel.firstName = userDictionary[Resources.NameFields.firstName.rawValue] ?? ""
        userModel.secondName = userDictionary[Resources.NameFields.secondName.rawValue] ?? ""
        userModel.thirdName = userDictionary[Resources.NameFields.thirdName.rawValue] ?? ""
        userModel.birthday = userDictionary[Resources.NameFields.birthday.rawValue] ?? ""
        userModel.gender = userDictionary[Resources.NameFields.gender.rawValue] ?? ""
        
        return userModel
    }
    
    static func getUserValue(_ key: String) -> String {
        
        let userDictionary = getUserDictionary()
        let stringValue = userDictionary[key] ?? ""
        
        return stringValue
    }
    
    static func saveUserImage(image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        defaults.set(data, forKey: "userPhoto")
    }
    
    static func loadUserImage() -> UIImage {
        guard let data = defaults.data(forKey: "userPhoto"),
              let image = UIImage(data: data) else {
            return UIImage()
        }
        return image
    }
}

//
//  Resources.swift
//  iOS_Junior_TestTask
//
//  Created by temaathletic on 04.11.2022.
//

import UIKit

enum Resources {
    
    enum NameFields: String, CaseIterable {
        case firstName = "Имя"
        case secondName = "Фамилия"
        case thirdName = "Отчество"
        case birthday = "Дата Рождения"
        case gender = "Пол"
    }
    
    enum Gender: String, CaseIterable {
        case noSpeciField = "Не указано"
        case man = "Мужской"
        case woman = "Женский"
    }
    
    enum Fonts {
        static func avenirNextRegular(with size: CGFloat) -> UIFont? {
            UIFont(name: "Avenir Next", size: size)
        }
    }
}

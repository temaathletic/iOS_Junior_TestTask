//
//  Date + Extensions.swift
//  iOS_Junior_TestTask
//
//  Created by temaathletic on 09.11.2022.
//

import Foundation

extension Date {
    
    func getStringFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}

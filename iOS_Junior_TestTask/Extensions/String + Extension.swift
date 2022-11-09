//
//  String + Extension.swift
//  iOS_Junior_TestTask
//
//  Created by temaathletic on 09.11.2022.
//

import Foundation

extension String {
    
    func getDateFromString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let date = dateFormatter.date(from: self) ?? Date()
        return date
    }
}

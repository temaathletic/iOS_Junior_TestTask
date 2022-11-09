//
//  UITableView + Extension.swift
//  iOS_Junior_TestTask
//
//  Created by temaathletic on 09.11.2022.
//

import UIKit

extension UITableView {
    
    func register(_ type: UITableViewCell.Type) {
        let className = String(describing: type)
        register(type, forCellReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T>(_ type: T.Type) -> T? {
        let className = String(describing: type)
        return dequeueReusableCell(withIdentifier: className) as? T
    }
    
}

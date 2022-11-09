//
//  UIView + Extensions.swift
//  iOS_Junior_TestTask
//
//  Created by temaathletic on 06.11.2022.
//

import UIKit

extension UIView {
    
    func addView(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}

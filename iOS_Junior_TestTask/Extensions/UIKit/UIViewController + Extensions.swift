//
//  UIViewController + Extensions.swift
//  iOS_Junior_TestTask
//
//  Created by temaathletic on 08.11.2022.
//

import UIKit

extension UIViewController {
    
    func presentSimpleAlert(title: String, message: String?) {

        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ок", style: .default)

        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func presesntChangeAlert(completionHandler: @escaping (Bool) -> Void) {
        
        let alertController = UIAlertController(title: "Данные были изменены",
                                                message: "Вы желаете сохранить изменения, в противном случае внесенныые правки будут отменены.",
                                                preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) {_ in
            completionHandler(true)
        }
        let skipAction = UIAlertAction(title: "Пропустить", style: .default) {_ in
            completionHandler(false)
        }

        alertController.addAction(saveAction)
        alertController.addAction(skipAction)
        
        present(alertController, animated: true)
    }
    
    func presesntUnchangeAlert(completionHandler: @escaping (Bool) -> Void) {
        
        let alertController = UIAlertController(title: "Данные не были изменены",
                                                message: "Вы желаете выйти или продолжить редактирование профиля",
                                                preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Выйти", style: .default) {_ in
            completionHandler(false)
        }
        let skipAction = UIAlertAction(title: "Продолжить", style: .default) {_ in
            completionHandler(true)
        }

        alertController.addAction(saveAction)
        alertController.addAction(skipAction)
        
        present(alertController, animated: true)
    }
}

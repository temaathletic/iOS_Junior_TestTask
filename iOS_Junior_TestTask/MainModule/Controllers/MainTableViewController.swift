//
//  ViewController.swift
//  iOS_Junior_TestTask
//
//  Created by temaathletic on 04.11.2022.
//

import UIKit

final class MainTableViewController: UITableViewController {
    
    private var userModel = UserModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        getUserModel()
        tableView.register(MainTableViewCell.self)
        
    }

    private func setupViews() {
        title = "Просмотр"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Редактирование",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(EditTapped))
    }
    
    @objc private func EditTapped() {
        let EditingTableViewController = EditingViewController(userModel)
        navigationController?.pushViewController(EditingTableViewController, animated: true)
    }
    
    private func getUserModel() {
        userModel = UserDefaultsHelper.getUserModel()
    }
    
    private func saveNewModel(_ model: UserModel) {
        UserDefaultsHelper.saveUserValue(Resources.NameFields.firstName.rawValue, value: model.firstName)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.secondName.rawValue, value: model.secondName)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.thirdName.rawValue, value: model.thirdName)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.birthsday.rawValue, value: model.birthsday)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.gender.rawValue, value: model.gender)
    }
    
    public func changeUserModel(model: UserModel) {
        // ssave new model
        saveNewModel(model)

        //refresh label
        userModel = model
        tableView.reloadData()
        
        
    }
}

//MARK: - UITableViewDataSource

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(MainTableViewCell.self) else {
            return UITableViewCell()
        }
        let nameField = Resources.NameFields.allCases[indexPath.row].rawValue
        let value = UserDefaultsHelper.getUserValue(Resources.NameFields.allCases[indexPath.row].rawValue)
        cell.configure(name: nameField, value: value)
        return cell
    }
}

//MARK: - UITableViewDelegate

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

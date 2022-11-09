//
//  PickerTableViewCell.swift
//  iOS_Junior_TestTask
//
//  Created by temaathletic on 06.11.2022.
//

import UIKit

final class PickerTableViewCell: UITableViewCell {
    
    static var idPickerViewCell = "idPickerViewCell"
    
    private let nameLabel = UILabel()
    private let genderPickerView = GenderPickerView()
    private let genderTextField = GenderTextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        
        nameLabel.font = Resources.Fonts.avenirNextRegular(with: 18)
        addView(nameLabel)
        
        genderPickerView.genderDelegate = self
        genderTextField.inputView = genderPickerView
        contentView.addView(genderTextField)
    }
    
    public func configure(name: String, value: String) {
        nameLabel.text = name
        genderTextField.text = value
    }
    
    public func getCellValue() -> String {
        guard let text = genderTextField.text else { return "" }
        return text
    }
}

//MARK: - GenderPickerViewProtocol

extension PickerTableViewCell: GenderPickerViewProtocol {
    func didSelect(row: Int) {
        genderTextField.text = Resources.Gender.allCases[row].rawValue
        genderTextField.resignFirstResponder()
    }
}


//MARK: - Set Constraints
 
extension PickerTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            
            genderTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            genderTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            genderTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            genderTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}

//
//  UserTableViewCell.swift
//  TravelTalk
//
//  Created by SangRae Kim on 1/13/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet var messageLabel: UITextView!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonConfigureCell()
    }
}

extension UserTableViewCell: ConfigureCell {
    func commonConfigureCell() {
        messageLabel.textColor = .black
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.backgroundColor = .systemGray5
        messageLabel.layer.borderColor = UIColor.systemGray.cgColor
        messageLabel.layer.borderWidth = 1
        messageLabel.layer.cornerRadius = 10
        
        dateLabel.textColor = .systemGray
        dateLabel.font = .systemFont(ofSize: 13)
    }
    
    func configureCell(_ item: Chat) {
        messageLabel.text = item.message
        dateLabel.text = Time(stringData: item.date).timeFormatting
    }
}

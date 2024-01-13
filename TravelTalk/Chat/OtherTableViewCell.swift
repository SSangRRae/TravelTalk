//
//  UserTableViewCell.swift
//  TravelTalk
//
//  Created by SangRae Kim on 1/13/24.
//

import UIKit

struct Time {
    var stringData: String
    let df = DateFormatter()
    
    var timeFormatting: String {
        df.dateFormat = "yyyy-MM-dd HH:mm"
        guard let date = df.date(from: stringData) else {
            return "Fail"
        }
        df.locale = Locale(identifier: "ko")
        df.dateFormat = "HH:mm a"
        return df.string(from: date)
    }
}

class OtherTableViewCell: UITableViewCell {

    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UITextView!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonConfigureCell()
        
    }
}

extension OtherTableViewCell: ConfigureCell {
    func commonConfigureCell() {
        DispatchQueue.main.async {
            self.userImageView.layer.cornerRadius = self.userImageView.frame.width / 2
        }
        userImageView.contentMode = .scaleAspectFit
        userImageView.clipsToBounds = true
        userImageView.layer.borderColor = UIColor.systemGray5.cgColor
        userImageView.layer.borderWidth = 1
        
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 16)
        
        messageLabel.textColor = .black
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.backgroundColor = .white
        messageLabel.layer.borderColor = UIColor.systemGray.cgColor
        messageLabel.layer.borderWidth = 1
        messageLabel.layer.cornerRadius = 10
        
        dateLabel.textColor = .systemGray
        dateLabel.font = .systemFont(ofSize: 13)
    }
    
    func configureCell(_ item: Chat) {
        userImageView.image = UIImage(named: item.user.rawValue)
        nameLabel.text = item.user.rawValue
        messageLabel.text = item.message
        dateLabel.text = Time(stringData: item.date).timeFormatting
    }
}

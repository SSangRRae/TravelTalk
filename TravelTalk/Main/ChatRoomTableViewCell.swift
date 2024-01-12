//
//  MainTableViewCell.swift
//  TravelTalk
//
//  Created by SangRae Kim on 1/12/24.
//

import UIKit

struct Date {
    var stringDate: String
    let df = DateFormatter()
    
    var dateFormatting: String {
        df.dateFormat = "yyyy-MM-dd HH:mm"
        guard let date = df.date(from: stringDate) else {
            return "Fail"
        }
        df.dateFormat = "yy.MM.dd"
        return df.string(from: date)
    }
}

class ChatRoomTableViewCell: UITableViewCell {
    
    @IBOutlet var roomImageView: UIImageView!
    @IBOutlet var roomName: UILabel!
    @IBOutlet var lastMessageLabel: UILabel!
    @IBOutlet var lastDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonDesignCell()
    }
    
    func commonDesignCell() {
        DispatchQueue.main.async {
            self.roomImageView.layer.cornerRadius = self.roomImageView.frame.width / 2
        }
        roomImageView.contentMode = .scaleAspectFit
        roomImageView.clipsToBounds = true
        roomImageView.layer.borderColor = UIColor.systemGray5.cgColor
        roomImageView.layer.borderWidth = 1
        
        roomName.textColor = .black
        roomName.font = .boldSystemFont(ofSize: 16)
        
        lastMessageLabel.textColor = .systemGray
        lastMessageLabel.font = .systemFont(ofSize: 14)
        
        lastDateLabel.textColor = .systemGray
        lastDateLabel.font = .systemFont(ofSize: 14)
    }
    
    func configureCell(_ item: ChatRoom) {
        roomImageView.image = UIImage(named: item.chatroomImage[0])
        roomName.text = item.chatroomName
        lastMessageLabel.text = item.chatList[item.chatList.count - 1].message
        lastDateLabel.text = Date(stringDate: item.chatList[item.chatList.count - 1].date).dateFormatting
        
    }
}

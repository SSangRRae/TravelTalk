//
//  ChatViewController.swift
//  TravelTalk
//
//  Created by SangRae Kim on 1/13/24.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var footerView: UIView!
    @IBOutlet var chatBubble: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    var contents: ChatRoom = ChatRoom(chatroomId: 0, chatroomImage: [""], chatroomName: "test")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureFooter()
        configureNavigationItem()
    }
}

extension ChatViewController {
    func configureNavigationItem() {
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(leftBarbuttonClicked))
        leftButton.tintColor = .black
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.title = contents.chatroomName
    }
    
    @objc func leftBarbuttonClicked() {
        navigationController?.popViewController(animated: true)
    }
}

extension ChatViewController: ConfigureTableView {
    func configureTableView() {
        let otherXib = UINib(nibName: "OtherTableViewCell", bundle: nil)
        let userXib = UINib(nibName: "UserTableViewCell", bundle: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(otherXib, forCellReuseIdentifier: "OtherTableViewCell")
        tableView.register(userXib, forCellReuseIdentifier: "UserTableViewCell")
        
        tableView.separatorStyle = .none
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = contents.chatList[indexPath.row]
        
        if item.user == .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
            
            cell.configureCell(item)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OtherTableViewCell", for: indexPath) as! OtherTableViewCell
            
            cell.configureCell(item)
            
            return cell
        }
    }
}

extension ChatViewController {
    func configureFooter() {
        chatBubble.placeholder = "메세지를 입력하세요"
        chatBubble.backgroundColor = .systemGray6
        
        sendButton.setImage(UIImage(systemName: "arrowtriangle.right"), for: .normal)
        sendButton.tintColor = .systemGray4
        
        tableView.tableFooterView = footerView
    }
}

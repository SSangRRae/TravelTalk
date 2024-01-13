//
//  MainViewController.swift
//  TravelTalk
//
//  Created by SangRae Kim on 1/12/24.
//

protocol ConfigureTableView {
    func configureTableView()
}

import UIKit

class ChatRoomViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeader()
        configureTableView()
    }
}

extension ChatRoomViewController: ConfigureTableView {
    func configureHeader() {
        navigationItem.title = "TRAVEL TALK"
        searchBar.placeholder = "친구 이름을 검색해보세요"
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let xib = UINib(nibName: "ChatRoomTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "ChatRoomTableViewCell")
    }
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatRoomTableViewCell", for: indexPath) as! ChatRoomTableViewCell
        
        cell.configureCell(mockChatList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Chat", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        
        vc.contents = mockChatList[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

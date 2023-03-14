//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let messages : [Message] = [
        Message(sender: "1@2.com", body: "Hi"),
        Message(sender: "1@2.com", body: "Hello~?"),
        Message(sender: "a@b.com", body: "Yeahasdfasdfasdfasdfas fxqwexfsadf fqwexf asdfxcvafe qfasdfxzcfgasdfqwe f")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
    }
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = messages[indexPath.row].body
//            content.secondaryText = messages[indexPath.row].body
            cell.label.text = content.text
            return cell
        } else {
            // Fallback on earlier versions
            return cell
        }
    }
}

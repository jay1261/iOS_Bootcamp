//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages : [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
        
    }
    
    func loadMessages(){
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener() { querySnapshot, error in

            self.messages = []

            if let e = error {
                print("There was an issue retrieving data from Firebase, \(e)")
            }
            else{
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                        }
                        
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            
                            let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                        }
                        
                    }
                }
            }
        }
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email{
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { error in
                if let e = error{
                    print("There was an issue saving data to firestore, \(e)")
                }
                else {
                    print("Successfully saved data")
                    
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                }
            }
        }
        
    }
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = message.body
//            content.secondaryText = messages[indexPath.row].body
            cell.label.text = content.text
            
            if message.sender == Auth.auth().currentUser?.email {
                cell.leftImageView.isHidden = true
                cell.rightImageView.isHidden = false
                cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
                cell.label.textColor = UIColor(named: K.BrandColors.purple)
            }
            else {
                cell.leftImageView.isHidden = false
                cell.rightImageView.isHidden = true
                cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lighBlue)
                cell.label.textColor = UIColor(named: K.BrandColors.blue)
            }
            
            
            return cell
        } else {
            // Fallback on earlier versions
            return cell
        }
    }
}

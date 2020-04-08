//
//  MessageThreadDetailViewController.swift
//  Message Board
//
//  Created by FGT MAC on 4/8/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import MessageKit


class MessageThreadDetailViewController: MessagesViewController {
    
    var messageThread: MessageThread?
    var messageThreadController: MessageThreadController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
}

extension MessageThreadDetailViewController : MessagesDataSource{
    
    func currentSender() -> SenderType {
        if let currentSender = messageThreadController?.currentUser {
            return currentSender
        }
        
        return Sender(displayName: "Unknown user", senderId: UUID().uuidString)
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        guard let message = self.messageThread?.messages[indexPath.item] else {
            fatalError("No message found in thread")
        }
        return message
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return self.messageThread?.messages.count ?? 0
    }
}

extension MessageThreadDetailViewController : MessagesLayoutDelegate{
    
}


extension MessageThreadDetailViewController : MessagesDisplayDelegate{
    
}

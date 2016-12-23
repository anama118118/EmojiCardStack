//
//  EmojiCardViewController.swift
//  AC3.2-EmojiCardStack
//
//  Created by Ana Ma on 12/22/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class EmojiCardViewController: UIViewController {
    var emojiCardView = EmojiCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emojiCardView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor.blue
        self.view.addSubview(emojiCardView)
        self.view.addSubview(drawcardButton)
        self.view.addSubview(showStackButton)
        self.view.addSubview(removeRandomButton)
        self.view.addSubview(removeAllButton)
        
        let _ = [
            emojiCardView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor),
            emojiCardView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            emojiCardView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            emojiCardView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
            ].map {$0.isActive = true}
        
        let _ = [
            drawcardButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            drawcardButton.topAnchor.constraint(equalTo: self.emojiCardView.bottomAnchor)
            ].map { $0.isActive = true }
        
        let _ = [
            removeRandomButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
            removeRandomButton.topAnchor.constraint(equalTo: self.drawcardButton.bottomAnchor, constant: 8.0),
            ].map {$0.isActive = true }
        
        showStackButton.translatesAutoresizingMaskIntoConstraints = false
        let _ = [
            showStackButton.firstBaselineAnchor.constraint(equalTo: drawcardButton.firstBaselineAnchor, constant: 0.0),
            showStackButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8.0)
            ].map {$0.isActive = true }
        
        let _ = [
            removeAllButton.firstBaselineAnchor.constraint(equalTo: removeRandomButton.firstBaselineAnchor, constant: 0.0),
            removeAllButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8.0),
            ].map {$0.isActive = true }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    lazy var drawcardButton: UIButton = {
        let dcb = UIButton(type: .system)
        dcb.translatesAutoresizingMaskIntoConstraints = false
        dcb.setTitle("Draw Card", for: .normal)
        dcb.setTitleColor(.black, for: .normal)
        dcb.addTarget(self, action: #selector(drawcardButtonTapped(sender:)), for: .touchUpInside)
        return dcb
    }()
    
    lazy var showStackButton: UIButton = {
        let ssb = UIButton(type: .system)
        ssb.setTitle("Show Stack", for: .normal)
        ssb.setTitleColor(.black, for: .normal)
        ssb.addTarget(self, action: #selector(showStackButtonTapped(sender:)), for: .touchUpInside)
        ssb.translatesAutoresizingMaskIntoConstraints = false
        return ssb
    }()
    
    lazy var removeRandomButton: UIButton = {
        let rrb = UIButton(type: .system)
        rrb.setTitle("Remove Random", for: .normal)
        rrb.setTitleColor(.black, for: .normal)
        rrb.addTarget(self, action: #selector(removeRandomButtonTapped(sender:)), for: .touchUpInside)
        rrb.translatesAutoresizingMaskIntoConstraints = false
        return rrb
    }()
    
    lazy var removeAllButton:UIButton = {
        let rab = UIButton(type: .system)
        rab.setTitle("Remove All", for: .normal)
        rab.setTitleColor(.black, for: .normal)
        rab.addTarget(self, action:#selector(removeAllButtonTapped(sender:)), for: .touchUpInside)
        rab.translatesAutoresizingMaskIntoConstraints = false
        return rab
    }()
    
    //Draw Card, Show Stack
    //Remove Random, Remove All
    
    func drawcardButtonTapped(sender: UIButton) {
        let randomEmojiViewController = EmojiCardViewController()
        let card = Dealer.shared.drawACard()
        randomEmojiViewController.emojiCardView.value = card.value
        randomEmojiViewController.emojiCardView.suite = card.suite
        
        if let navVC = self.navigationController {
            print("NavVC found")
            navVC.pushViewController(randomEmojiViewController, animated: true)
        }
    }
    
    func showStackButtonTapped(sender: UIButton) {
        if let navVC = self.navigationController {
            print("NavVC found")
            let emojiTableViewController = EmojiStackTableViewController()
            navVC.pushViewController(emojiTableViewController, animated: true)
        }
    }
    
    func removeRandomButtonTapped(sender: UIButton) {
        Dealer.shared.deleteACards()
    }
    
    func removeAllButtonTapped(sender: UIButton) {
        Dealer.shared.deleteACards()
    }
}

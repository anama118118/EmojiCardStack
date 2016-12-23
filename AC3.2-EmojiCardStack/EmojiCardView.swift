//
//  EmojiCard.swift
//  AC3.2-EmojiCardStack
//
//  Created by Ana Ma on 12/20/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

protocol PlayingCard {
    var value: Int { get set }
    var suite: String { get set }
}

class EmojiCardView: UIView, PlayingCard {
//    @IBOutlet weak var upperLeftCornerLabel: UILabel!
//    @IBOutlet weak var lowerRightCornerLabel: UILabel!
//    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet var view: UIView!
    
    var value: Int = 1 {
        didSet {
//            self.upperLeftCornerLabel.text = "\(value)\(suite)"
//            self.lowerRightCornerLabel.text = "\(value)\(suite)"
//            self.centerLabel.text = String(repeating: "\(suite)", count: value)
            self.upperLeftCornerLabel2.text = "\(value)\(suite)"
            self.lowerRightCornerLabel2.text = "\(value)\(suite)"
            self.centerLabel2.text = String(repeating: "\(suite)", count: value)
        }
    }
    var suite: String = "😀" {
        didSet {
//            self.upperLeftCornerLabel.text = "\(value)\(suite)"
//            self.lowerRightCornerLabel.text = "\(value)\(suite)"
//            self.centerLabel.text = String(repeating: "\(suite)", count: value)
            self.upperLeftCornerLabel2.text = "\(value)\(suite)"
            self.lowerRightCornerLabel2.text = "\(value)\(suite)"
            self.centerLabel2.text = String(repeating: "\(suite)", count: value)
        }
    }
    var randomColor: UIColor {
        let r = CGFloat(arc4random_uniform(254))
        let g = CGFloat(arc4random_uniform(254))
        let b = CGFloat(arc4random_uniform(254))
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    
    lazy var upperLeftCornerLabel2: UILabel = {
        let ulcl = UILabel()
        ulcl.textAlignment = NSTextAlignment.left
        ulcl.text = "\(self.value)\(self.suite)"
        ulcl.translatesAutoresizingMaskIntoConstraints = false
        return ulcl
    }()
    
    lazy var lowerRightCornerLabel2: UILabel = {
        let lrcl = UILabel()
        lrcl.textAlignment = NSTextAlignment.right
        lrcl.text = "\(self.value)\(self.suite)"
        lrcl.translatesAutoresizingMaskIntoConstraints = false
        return lrcl
    }()
    
    lazy var centerLabel2: UILabel = {
        let cl = UILabel()
        //cl.adjustsFontSizeToFitWidth = true
        cl.adjustsFontForContentSizeCategory = true
        cl.textAlignment = NSTextAlignment.center
        cl.numberOfLines = 0
        cl.text = String(repeating: "\(self.suite)", count: self.value)
        cl.translatesAutoresizingMaskIntoConstraints = false
        return cl
    }()
    
    func constraintLabels() {
        let _ = [
            upperLeftCornerLabel2.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0),
            upperLeftCornerLabel2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            upperLeftCornerLabel2.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            upperLeftCornerLabel2.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            ].map { $0.isActive = true }
        let _ = [
            lowerRightCornerLabel2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8.0),
            lowerRightCornerLabel2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0),
            lowerRightCornerLabel2.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            lowerRightCornerLabel2.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            ].map { $0.isActive = true }
        let _ = [
            centerLabel2.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 8.0),
            centerLabel2.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 8.0),
            centerLabel2.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            centerLabel2.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
            ].map { $0.isActive = true }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = self.randomColor
//        if let view = Bundle.main.loadNibNamed("EmojiCardView", owner: self, options: nil)?.first as? UIView {
//            self.addSubview(view)
//            view.frame = self.bounds
//            self.upperLeftCornerLabel.text = "\(value)\(suite)"
//            self.lowerRightCornerLabel.text = "\(value)\(suite)"
//            self.centerLabel.text = String(repeating: "\(suite)", count: value)
//        }
        self.addSubview(upperLeftCornerLabel2)
        self.addSubview(lowerRightCornerLabel2)
        self.addSubview(centerLabel2)
        self.constraintLabels()
    }
    
    //Use in only storyboards
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
//        if let view = Bundle.main.loadNibNamed("EmojiCardView", owner: self, options: nil)?.first as? UIView {
//            self.addSubview(view)
//            view.frame = self.bounds
//            self.upperLeftCornerLabel.text = "\(value)\(suite)"
//            self.lowerRightCornerLabel.text = "\(value)\(suite)"
//            //let text = String(repeating: "\(suite)", count: value)
//            self.centerLabel.text = String(repeating: "\(suite)", count: value)
//        }
    }
}

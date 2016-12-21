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
    var value: Int
    var suite: String
    var randomColor: UIColor {
        let r = CGFloat(arc4random_uniform(254))
        let g = CGFloat(arc4random_uniform(254))
        let b = CGFloat(arc4random_uniform(254))
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    
    init(value: Int, suite: String, frame: CGRect) {
        self.value = value
        self.suite = suite
        super.init(frame: frame)
        self.backgroundColor = self.randomColor
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        //super.init(coder: aDecoder)
    }
}

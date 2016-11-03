//
//  Condition.swift
//  HighlightTextView
//
//  Created by KazukiYusa on 2016/10/23.
//  Copyright © 2016年 KazukiYusa. All rights reserved.
//

import Foundation

public struct Condition {
    
    public struct MaxLimit {
        
        let characterLimit: Int?
        let highlightColor: UIColor?
        
        public init(characterLimit: Int? = 100, highlightColor: UIColor? = #colorLiteral(red: 0.9960784314, green: 0.8, blue: 0.8039215686, alpha: 0.7006465517)) {
            
            self.characterLimit = characterLimit
            self.highlightColor = highlightColor
        }
    }
    
    public struct MinLimit {
        
        let characterLimit: Int?
        let highlightColor: UIColor?
        
        public init(characterLimit: Int? = nil, highlightColor: UIColor? = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5)) {
            
            self.characterLimit = characterLimit
            self.highlightColor = highlightColor
        }
    }
    
    let maxLimit: MaxLimit?
    let minLimit: MinLimit?
    
    public init(maxLimit: MaxLimit? = MaxLimit(), minLimit: MinLimit? = MinLimit()) {
        
        self.maxLimit = maxLimit
        self.minLimit = minLimit
    }
}

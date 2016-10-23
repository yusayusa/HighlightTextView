//
//  Condition.swift
//  HighlightTextView
//
//  Created by KazukiYusa on 2016/10/23.
//  Copyright © 2016年 KazukiYusa. All rights reserved.
//

import Foundation

public struct Condition {
    
    public var characterMaxLimit: Int?
    public var characterMinLimit: Int?
    public var highlightColor: UIColor?
    
    public init(characterMaxLimit: Int? = 100, characterMinLimit: Int? = 30, highlightColor: UIColor? = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)) {
        
        self.characterMaxLimit = characterMaxLimit
        self.characterMinLimit = characterMinLimit
        self.highlightColor = highlightColor
    }
}

//
//  Condition.swift
//  HighlightTextView
//
//  Created by KazukiYusa on 2016/10/23.
//  Copyright © 2016年 KazukiYusa. All rights reserved.
//

import Foundation

public struct Condition {
    
    public let characterMaxLimit: Int?
    public let characterMinLimit: Int?
    public let highlightColor: UIColor?
    
    public init(characterMaxLimit: Int?, characterMinLimit: Int?, highlightColor: UIColor?) {
        
        self.characterMaxLimit = characterMaxLimit
        self.characterMinLimit = characterMinLimit
        self.highlightColor = highlightColor
    }
}

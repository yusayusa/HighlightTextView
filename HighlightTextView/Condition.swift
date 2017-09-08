//
//  Condition.swift
//  HighlightTextView
//
//  Created by KazukiYusa on 2016/10/23.
//  Copyright © 2016年 KazukiYusa. All rights reserved.
//

import Foundation

public struct Condition {
  
  let range: Range<Int>
  let minHighlightColor: UIColor?
  let maxHighlightColor: UIColor?
  
  public init(range: Range<Int>, minHighlightColor: UIColor? = nil, maxHighlightColor: UIColor? = nil) {
    
    self.range = range
    self.minHighlightColor = minHighlightColor
    self.maxHighlightColor = maxHighlightColor
  }
}

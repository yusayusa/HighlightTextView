//
//  HighlightTextView.swift
//  HighlightTextView
//
//  Created by KazukiYusa on 2016/10/10.
//  Copyright © 2016年 KazukiYusa. All rights reserved.
//

import UIKit

extension UITextView {
  
  private enum StoredProperties {
    static var condition: Void?
  }

  private var condition: Condition? {
    get {
      return objc_getAssociatedObject(self, &StoredProperties.condition) as? Condition
    }
    set {
      objc_setAssociatedObject(self,
                               &StoredProperties.condition,
                               newValue,
                               objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
  }

  public func setHighlight(condition: Condition) {
    
    self.condition = condition
    
    highlight(condition: condition)

    NotificationCenter.default
      .addObserver(forName: .UITextViewTextDidChange,
                   object: nil,
                   queue: nil) { [weak self] _ in
                    self?.highlight(condition: condition)
    }
  }
  
  public func refreshHighlight() {
    
    if let condition = condition {
      highlight(condition: condition)
    }
  }
  
  private func highlight(condition: Condition) {
    
    if markedTextRange != nil {
      return
    }
    
    let min = condition.range.lowerBound
    let max = condition.range.upperBound
    
    if min != Int.min {
      
      let color = attributedText.length >= min ? UIColor.clear : condition.minHighlightColor
      let attributes = NSMutableAttributedString(attributedString: attributedText)
      attributes.addAttributes([NSBackgroundColorAttributeName: color],
                               range: NSRange(location: 0,
                                              length: attributedText.length))
      attributedText = attributes
    }
    
    if max != Int.max, attributedText.length >= max {
      
      let attributes = NSMutableAttributedString(attributedString: attributedText)
      attributes.addAttributes([NSBackgroundColorAttributeName: condition.maxHighlightColor],
                               range: NSRange(location: max,
                                              length: attributedText.length - max))
      attributedText = attributes
    }
  }  
}


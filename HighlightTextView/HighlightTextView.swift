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
    static var maxLength: Void?
  }
  
  private var maxLength: Int? {
    get {
      return objc_getAssociatedObject(self, &StoredProperties.maxLength) as? Int
    }
    set {
      objc_setAssociatedObject(self,
                               &StoredProperties.maxLength,
                               newValue,
                               objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
  }
  
  public func setHighlight(condition: Condition) {
    
    let min = condition.range.lowerBound
    let max = condition.range.upperBound

    if min != Int.min {
      
      let color = text.characters.count >= min ? UIColor.clear : condition.minHighlightColor
      let attributes = NSMutableAttributedString(attributedString: attributedText)
      attributes.addAttributes([NSBackgroundColorAttributeName: color],
                               range: NSRange(location: 0,
                                              length: attributedText.length))
      attributedText = attributes
    }
    
    if max != Int.max, text.characters.count >= max {
      
      if text.characters.count >= max {
        maxLength = max
      }
      
      if let maxLocationLength = maxLength {
        let attributes = NSMutableAttributedString(attributedString: attributedText)
        attributes.addAttributes([NSBackgroundColorAttributeName: condition.maxHighlightColor],
                                 range: NSRange(location: maxLocationLength,
                                                length: attributedText.length - maxLocationLength))
        attributedText = attributes
      }
    }
    
    NotificationCenter.default
      .addObserver(forName: .UITextViewTextDidChange,
                   object: nil,
                   queue: nil) { [weak self] _ in
                    self?.highlight(condition: condition)
    }
  }
  
  private func highlight(condition: Condition) {
    
    if markedTextRange != nil {
      return
    }
    
    let min = condition.range.lowerBound
    let max = condition.range.upperBound
    
    if min != Int.min {
      
      let color = text.characters.count >= min ? UIColor.clear : condition.minHighlightColor
      let attributes = NSMutableAttributedString(attributedString: attributedText)
      attributes.addAttributes([NSBackgroundColorAttributeName: color],
                               range: NSRange(location: 0,
                                              length: attributedText.length))
      attributedText = attributes
    }
    
    if max != Int.max, text.characters.count >= max {
      
      if text.characters.count == max {
        maxLength = attributedText.length
      }
      
      if let maxLocationLength = maxLength {
        let attributes = NSMutableAttributedString(attributedString: attributedText)
        attributes.addAttributes([NSBackgroundColorAttributeName: condition.maxHighlightColor],
                                 range: NSRange(location: maxLocationLength,
                                                length: attributedText.length - maxLocationLength))
        attributedText = attributes
      }
    }
  }
}


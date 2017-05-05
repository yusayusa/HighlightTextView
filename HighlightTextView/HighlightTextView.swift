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
    static var minLength: Void?
    static var maxLength: Void?
  }
  
  private var minLength: Int? {
    get {
      return objc_getAssociatedObject(self, &StoredProperties.minLength) as? Int
    }
    set {
      objc_setAssociatedObject(self,
                               &StoredProperties.minLength,
                               newValue,
                               objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
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
    
    highlight(condition: condition)

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
    
    setLength(condition: condition)
    
    guard let min = minLength, let max = maxLength else {
      return
    }
    
    if min != Int.min, text.characters.count < min {
      
      let attributes = NSMutableAttributedString(attributedString: attributedText)
      attributes.addAttributes([NSBackgroundColorAttributeName: condition.minHighlightColor],
                               range: NSRange(location: 0,
                                              length: attributedText.length))
      attributedText = attributes
    }
    
    if text.characters.count > min && text.characters.count < max {
      
      let attributes = NSMutableAttributedString(attributedString: attributedText)
      attributes.addAttributes([NSBackgroundColorAttributeName: UIColor.clear],
                               range: NSRange(location: 0,
                                              length: attributedText.length))
      attributedText = attributes
    }
    
    if max != Int.max, text.characters.count > max {
      
      if attributedText.length - max > 0 {
        
        let attributes = NSMutableAttributedString(attributedString: attributedText)
        attributes.addAttributes([NSBackgroundColorAttributeName: condition.maxHighlightColor],
                                 range: NSRange(location: max,
                                                length: attributedText.length - max))
        attributedText = attributes
      }
    }
  }
  
  private func setLength(condition: Condition) {
    
    let min = condition.range.lowerBound
    let max = condition.range.upperBound

    if text.characters.count != attributedText.length {
      
      minLength = attributedText.length
      maxLength = max + (attributedText.length - text.characters.count)
    } else {
    
      minLength = min
      maxLength = max
    }
  }
}


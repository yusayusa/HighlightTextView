//
//  HighlightTextView.swift
//  HighlightTextView
//
//  Created by KazukiYusa on 2016/10/10.
//  Copyright © 2016年 KazukiYusa. All rights reserved.
//

import UIKit

extension UITextView {
  
  // MARK: - Public
  
  public func prepareForHighlight(condition: Condition) {
    
    if let characterMinLimit = condition.minLimit?.characterLimit,
      let highlightColor = condition.minLimit?.highlightColor,
      text.characters.count < characterMinLimit {
      
      let attributes = NSMutableAttributedString(attributedString: attributedText)
      attributes.addAttributes([NSBackgroundColorAttributeName: highlightColor],
                               range: NSRange(location: 0,
                                              length: text.characters.count))
      attributedText = attributes
    }
    
    NotificationCenter.default
      .addObserver(self,
                   selector: #selector(self.didChangeTextView),
                   name: NSNotification.Name.UITextViewTextDidChange,
                   object: self)
    
    self.condition = condition
  }
  
  // MARK: - Private

  private dynamic func didChangeTextView() {
    
    guard let condition = condition else {
      return
    }
    
    if markedTextRange != nil {
      return
    }
    
    if let characterMinLimit = condition.minLimit?.characterLimit,
      let highlightColor = condition.minLimit?.highlightColor {
      
      let color = text.characters.count >= characterMinLimit ? UIColor.clear : highlightColor
      
      let attributes = NSMutableAttributedString(attributedString: attributedText)
      attributes.addAttributes([NSBackgroundColorAttributeName: color],
                               range: NSRange(location: 0,
                                              length: attributedText.length))
      attributedText = attributes
    }
    
    if let characterMaxLimit = condition.maxLimit?.characterLimit,
      let highlightColor = condition.maxLimit?.highlightColor,
      text.characters.count >= characterMaxLimit {
      
      if text.characters.count == characterMaxLimit {
        maxLocationLength = attributedText.length
      }
      
      if let maxLocationLength = maxLocationLength {
        let attributes = NSMutableAttributedString(attributedString: attributedText)
        attributes.addAttributes([NSBackgroundColorAttributeName: highlightColor],
                                 range: NSRange(location: maxLocationLength,
                                                length: attributedText.length - maxLocationLength))
        attributedText = attributes
      }
    }
  }
  
  private var condition: Condition? {
    get {
      
      let value = objc_getAssociatedObject(self, &StoredProperties.condition) as? Condition
      return value
    }
    set {
      
      objc_setAssociatedObject(
        self,
        &StoredProperties.condition,
        newValue,
        objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
  }
  
  private var maxLocationLength: Int? {
    get {
      
      let value = objc_getAssociatedObject(self, &StoredProperties.maxLocationLength) as? Int
      return value
    }
    set {
      
      objc_setAssociatedObject(
        self,
        &StoredProperties.maxLocationLength,
        newValue,
        objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
  }
  
  private struct StoredProperties {
    
    static var condition: Void?
    static var maxLocationLength: Void?
  }
}

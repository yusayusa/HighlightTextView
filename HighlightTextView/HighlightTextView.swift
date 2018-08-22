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

    textStorage.beginEditing()
    defer {
      textStorage.endEditing()
    }

    let min = Swift.max(condition.range.lowerBound, 0)
    let max = Swift.min(condition.range.upperBound, textStorage.length)

    textStorage.addAttributes([NSBackgroundColorAttributeName: UIColor.clear],
                              range: NSRange(location: 0,
                                             length: textStorage.length))
    if let color = condition.minHighlightColor, textStorage.length < min {

      textStorage.addAttributes([NSBackgroundColorAttributeName: color],
                                range: NSRange(location: 0,
                                               length: textStorage.length))
    }
    else if let color = condition.maxHighlightColor, textStorage.length > max {
      
      textStorage.addAttributes([NSBackgroundColorAttributeName: color],
                               range: NSRange(location: max,
                                              length: textStorage.length - max))
    }
  }  
}


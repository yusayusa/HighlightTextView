//
//  HighlightTextView.swift
//  HighlightTextView
//
//  Created by KazukiYusa on 2016/10/10.
//  Copyright © 2016年 KazukiYusa. All rights reserved.
//

import UIKit

extension UITextView {
  
  private struct Condition {
    
    let range: Range<Int>
    let minHighlightColor: UIColor?
    let maxHighlightColor: UIColor?
    
    public init(range: Range<Int>, minHighlightColor: UIColor? = nil, maxHighlightColor: UIColor? = nil) {
      
      self.range = range
      self.minHighlightColor = minHighlightColor
      self.maxHighlightColor = maxHighlightColor
    }
  }

  private enum StoredProperties {
    static var condition: Void?
    static var subscription: Void?
  }
  
  private var condition: Condition? {
    get {
      return objc_getAssociatedObject(self, &StoredProperties.condition) as? Condition
    }
    set {
      objc_setAssociatedObject(
        self,
        &StoredProperties.condition,
        newValue,
        .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
  }

  private var subscription: NSObjectProtocol? {
    get {
      return objc_getAssociatedObject(self, &StoredProperties.subscription) as? NSObjectProtocol
    }
    set {
      objc_setAssociatedObject(
        self,
        &StoredProperties.subscription,
        newValue,
        .OBJC_ASSOCIATION_RETAIN_NONATOMIC
      )
    }
  }
  
  public func setHighlight(range: Range<Int>, minHighlightColor: UIColor? = nil, maxHighlightColor: UIColor? = nil) {
    
    let condition = Condition(range: range, minHighlightColor: minHighlightColor, maxHighlightColor: maxHighlightColor)
    self.condition = condition
    
    highlight(condition: condition)
    
    if let subscription = self.subscription {
      NotificationCenter.default.removeObserver(subscription)
    }
    
    subscription = NotificationCenter.default.addObserver(
      forName: .NSTextStorageDidProcessEditing,
      object: textStorage,
      queue: nil) { [weak self] _ in
        self?.refreshHighlight()
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
  
  private func refreshHighlight() {
    
    if let condition = condition {
      highlight(condition: condition)
    }
  }
}

//
//  HighlightTextView.swift
//  HighlightTextView
//
//  Created by KazukiYusa on 2016/10/10.
//  Copyright © 2016年 KazukiYusa. All rights reserved.
//

import UIKit

open class HighlightTextView: UITextView {
    
    open var condition: Condition?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if let characterMinLimit = condition?.characterMinLimit,
            let highlightColor = condition?.highlightColor,
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
    }
    
    private dynamic func didChangeTextView() {
        
        if markedTextRange != nil {
            return
        }
        
        if let characterMinLimit = condition?.characterMinLimit,
            let highlightColor = condition?.highlightColor {
            
            if text.characters.count >= characterMinLimit {
                
                let attributes = NSMutableAttributedString(attributedString: attributedText)
                attributes.addAttributes([NSBackgroundColorAttributeName: UIColor.clear],
                                         range: NSRange(location: 0,
                                                        length: text.characters.count))
                attributedText = attributes
            }
            
            if text.characters.count < characterMinLimit {
                
                let attributes = NSMutableAttributedString(attributedString: attributedText)
                attributes.addAttributes([NSBackgroundColorAttributeName: highlightColor],
                                         range: NSRange(location: 0,
                                                        length: text.characters.count))
                attributedText = attributes
            }
        }
        
        if let characterMaxLimit = condition?.characterMaxLimit,
            let highlightColor = condition?.highlightColor,
            text.characters.count >= characterMaxLimit {
            
            let attributes = NSMutableAttributedString(attributedString: attributedText)
            attributes.addAttributes([NSBackgroundColorAttributeName: highlightColor],
                                     range: NSRange(location: characterMaxLimit,
                                                    length: text.characters.count - characterMaxLimit))
            attributedText = attributes
        }
    }
}

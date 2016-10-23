//
//  HighlightTextView.swift
//  HighlightTextView
//
//  Created by KazukiYusa on 2016/10/10.
//  Copyright © 2016年 KazukiYusa. All rights reserved.
//

import UIKit

open class HighlightTextView: UITextView {
    
    open var condition: Condition = Condition(characterMaxLimit: 100, characterMinLimit: nil, highlightColor: #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1))
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(self.didChangeTextView),
                         name: NSNotification.Name.UITextViewTextDidChange,
                         object: self)
    }
    
    private dynamic func didChangeTextView() {
        
        guard let characterMaxLimit = condition.characterMaxLimit, let highlightColor = condition.highlightColor else {
            return
        }
        
        if text.characters.count < characterMaxLimit {
            return
        }
        
        if markedTextRange != nil {
            return
        }
        
        let attributes = NSMutableAttributedString(attributedString: attributedText)
        attributes.addAttributes([NSBackgroundColorAttributeName: highlightColor],
                                 range: NSRange(location: characterMaxLimit,
                                                length: text.characters.count - characterMaxLimit))
        attributedText = attributes
    }
}

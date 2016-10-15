//
//  HighlightTextView.swift
//  HighlightTextView
//
//  Created by KazukiYusa on 2016/10/10.
//  Copyright © 2016年 KazukiYusa. All rights reserved.
//

import UIKit

open class HighlightTextView: UITextView {
    
    open var characterLimit: Int = 100
    open var overLimitBackgroundColor: UIColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(self.didChangeTextView),
                         name: NSNotification.Name.UITextViewTextDidChange,
                         object: self)
    }
    
    private dynamic func didChangeTextView() {
        
        if text.characters.count < characterLimit {
            return
        }
        
        if markedTextRange != nil {
            return
        }
        
        let attributes = NSMutableAttributedString(attributedString: attributedText)
        attributes.addAttributes([NSBackgroundColorAttributeName: overLimitBackgroundColor],
                                 range: NSRange(location: characterLimit,
                                                length: text.characters.count - characterLimit))
        attributedText = attributes
    }
}

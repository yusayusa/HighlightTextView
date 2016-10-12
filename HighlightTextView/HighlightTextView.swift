//
//  HighlightTextView.swift
//  HighlightTextView
//
//  Created by KazukiYusa on 2016/10/10.
//  Copyright © 2016年 KazukiYusa. All rights reserved.
//

import UIKit

open class HighlightTextView: UITextView {
    
    open var maxCharactersNumber: Int = 100
    open var overBackgroundColor: UIColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(self.didChangeTextView(notification:)),
                         name: NSNotification.Name.UITextViewTextDidChange,
                         object: self)
    }
    
    private func didChangeTextView(notification: NSNotification) {
        
        if text.characters.count <= maxCharactersNumber {
            return
        }
                
        let attributes = NSMutableAttributedString(attributedString: attributedText)
        attributes.addAttributes([NSBackgroundColorAttributeName: overBackgroundColor],
                                 range: NSRange(location: maxCharactersNumber,
                                                length: text.characters.count - maxCharactersNumber))
        attributedText = attributes
    }
}

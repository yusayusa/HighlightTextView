//
//  HighlightTextView.swift
//  HighlightTextView
//
//  Created by KazukiYusa on 2016/10/10.
//  Copyright © 2016年 KazukiYusa. All rights reserved.
//

import UIKit

open class HighlightTextView: UITextView, UITextViewDelegate {
    
    open var maxCharactersNumber: Int = 20
    open var overBackgroundColor: UIColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        delegate = self
    }
    
    open func textViewDidChange(_ textView: UITextView) {
        
        if textView.text.characters.count <= maxCharactersNumber {
            return
        }
        
        guard let font = font else {
            return
        }
        
        let attributes = NSMutableAttributedString(string: text)
        attributes.addAttributes([NSFontAttributeName: font], range: NSRange(location: 0, length: text.characters.count))
        attributes.addAttributes([NSBackgroundColorAttributeName: overBackgroundColor],
                                 range: NSRange(location: maxCharactersNumber,
                                                length: textView.text.characters.count - maxCharactersNumber))
        attributedText = attributes
    }
}

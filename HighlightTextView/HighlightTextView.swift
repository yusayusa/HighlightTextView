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
    open var overBackgroundColor: UIColor = UIColor.red
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        delegate = self
    }
    
    open func textViewDidChange(_ textView: UITextView) {
        
        if textView.text.characters.count <= maxCharactersNumber {
            return
        }
        guard let font = textView.font else {
            return
        }
        let attributes = NSMutableAttributedString(string: text)
        attributes.setAttributes([NSBackgroundColorAttributeName: UIColor.red, NSFontAttributeName: font],
                                 range: NSRange(location: maxCharactersNumber,
                                                length: textView.text.characters.count - maxCharactersNumber))
        attributedText = attributes
    }
}

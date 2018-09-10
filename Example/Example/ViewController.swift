//
//  ViewController.swift
//  Example
//
//  Created by KazukiYusa on 2016/10/10.
//  Copyright © 2016年 KazukiYusa. All rights reserved.
//

import UIKit

import HighlightTextView

final class ViewController: UIViewController {
  
  @IBOutlet private weak var highlightTextView: UITextView! {
    didSet {
      
      highlightTextView.font = UIFont.boldSystemFont(ofSize: 20)
      highlightTextView.text = "50 character limit"
      highlightTextView.setHighlight(
        range: 3..<50,
        minHighlightColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.5),
        maxHighlightColor: #colorLiteral(red: 0.9960784314, green: 0.8, blue: 0.8039215686, alpha: 0.7006465517)
      )
    }
  }

  @IBAction func tapInputAttributedTextButton(_ sender: Any) {
  
    highlightTextView.attributedText = NSAttributedString(string:  "Input AttributedText, Input AttributedText, Input AttributedText, Input AttributedText")
  }
  
  @IBAction func tapInputTextButton(_ sender: Any) {
    
    highlightTextView.text = "InputText, InputText, InputText, InputText, InputText, InputText"
  }
}


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
      
      let condition = Condition(range: 20...50,
                                minHighlightColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5),
                                maxHighlightColor: #colorLiteral(red: 0.9960784314, green: 0.8, blue: 0.8039215686, alpha: 0.7006465517))
      highlightTextView.setHighlight(condition: condition)
    }
  }
}


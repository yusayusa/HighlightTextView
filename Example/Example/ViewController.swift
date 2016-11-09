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
      
      let condition = Condition(maxLimit: Condition.MaxLimit(characterLimit: 50),
                                minLimit: Condition.MinLimit(characterLimit: 20))
      highlightTextView.prepareForHighlight(condition: condition)
    }
  }
}


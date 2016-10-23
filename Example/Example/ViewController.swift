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

    @IBOutlet private weak var highlightTextView: HighlightTextView! {
        didSet {
            let condition = Condition(characterMaxLimit: 50, characterMinLimit: nil, highlightColor: nil)
            highlightTextView.condition = condition
            highlightTextView.font = UIFont.boldSystemFont(ofSize: 20)
            highlightTextView.text = "50 character limit"
        }
    }
}


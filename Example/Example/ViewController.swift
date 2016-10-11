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

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBOutlet private weak var highlightTextView: HighlightTextView! {
        didSet {
            highlightTextView.maxCharactersNumber = 10
            highlightTextView.font = UIFont.boldSystemFont(ofSize: 15)
            highlightTextView.text = "10文字まで"
        }
    }
}


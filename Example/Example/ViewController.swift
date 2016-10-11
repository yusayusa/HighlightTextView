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
        
        highlightTextView.maxCharactersNumber = 5
        highlightTextView.overBackgroundColor = UIColor.yellow
    }

    @IBOutlet private weak var highlightTextView: HighlightTextView!
}


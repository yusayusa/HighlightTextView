//
//  HighlightTextViewTests.swift
//  HighlightTextViewTests
//
//  Created by KazukiYusa on 2017/02/13.
//  Copyright © 2017年 KazukiYusa. All rights reserved.
//

import XCTest
import UIKit

@testable import HighlightTextView

class HighlightTextViewTests: XCTestCase {
  
  let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
  static let rangeMin = 10
  static let rangeMax = 100
  static let minColor = UIColor.blue
  static let maxColor = UIColor.red

  func createText(charactersCount: Int) -> String {
    
    var string = ""
    for _ in 0..<charactersCount {
      string.append("A")
    }
    return string
  }
  
  func createEmojiText(charactersCount: Int) -> String {
    
    var string = ""
    for _ in 0..<charactersCount {
      string.append("👾")
    }
    return string
  }

  func setCondition() {

    textView.setHighlight(range: HighlightTextViewTests.rangeMin..<HighlightTextViewTests.rangeMax,
                          minHighlightColor: HighlightTextViewTests.minColor,
                          maxHighlightColor: HighlightTextViewTests.maxColor)
  }
  
  // normal text
  func testTextCharactersMinColor() {
    
    textView.text = createText(charactersCount: 1)
    setCondition()

    textView.text.enumerated().forEach { index, _ in
        if let color = textView.attributedText.attribute(.backgroundColor, at: index, effectiveRange: nil) as? UIColor {
        XCTAssertTrue(HighlightTextViewTests.minColor == color, "testTextCharactersMinColor")
      }
    }
  }
  
  func testTextCharactersMinColor2() {
    
    textView.text = createText(charactersCount: 9)
    setCondition()
    
    textView.text.enumerated().forEach { index, _ in
      if let color = textView.attributedText.attribute(.backgroundColor, at: index, effectiveRange: nil) as? UIColor {
        XCTAssertTrue(HighlightTextViewTests.minColor == color, "testTextCharactersMinColor2")
      }
    }
  }
  
  func testTextCharactersNonColor() {
    
    textView.text = createText(charactersCount: 10)
    setCondition()

    textView.text.enumerated().forEach { index, _ in
      if let color = textView.attributedText.attribute(.backgroundColor, at: index, effectiveRange: nil) as? UIColor {
        XCTAssertTrue(UIColor.clear == color, "testTextCharactersNonColor")
      }
    }
  }
  
  func testTextCharactersNonColor2() {
    
    textView.text = createText(charactersCount: 99)
    setCondition()
    
    textView.text.enumerated().forEach { index, _ in
      if let color = textView.attributedText.attribute(.backgroundColor, at: index, effectiveRange: nil) as? UIColor {
        XCTAssertTrue(UIColor.clear == color, "testTextCharactersNonColor2")
      }
    }
  }

  func testTextCharactersNonColor3() {
    
    textView.text = createText(charactersCount: 100)
    setCondition()
    
    textView.text.enumerated().forEach { index, _ in
      if let color = textView.attributedText.attribute(.backgroundColor, at: index, effectiveRange: nil) as? UIColor {
        XCTAssertTrue(UIColor.clear == color, "testTextCharactersNonColor3")
      }
    }
  }
  
  func testTextCharactersMaxColor() {
    
    textView.text = createText(charactersCount: 101)
    setCondition()
    
    textView.text.enumerated().forEach { index, _ in
      if let color = textView.attributedText.attribute(.backgroundColor, at: index, effectiveRange: nil) as? UIColor {
        if index < HighlightTextViewTests.rangeMax {
          XCTAssertTrue(UIColor.clear == color, "testTextCharactersMaxColor")
        }
        else {
          XCTAssertTrue(HighlightTextViewTests.maxColor == color, "testTextCharactersMaxColor")
        }
      }
    }
  }
  
  // emoji text
  func testEmojiTextCharactersMinColor() {
    
    textView.text = createEmojiText(charactersCount: 1)
    setCondition()
    
    textView.text.enumerated().forEach { index, _ in
      if let color = textView.attributedText.attribute(.backgroundColor, at: index, effectiveRange: nil) as? UIColor {
        XCTAssertTrue(HighlightTextViewTests.minColor == color, "testEmojiTextCharactersMinColor")
      }
    }
  }
  
  func testEmojiTextCharactersMinColor2() {
    
    textView.text = createEmojiText(charactersCount: 9)
    setCondition()

    textView.text.enumerated().forEach { index, text in
      if let color = textView.attributedText.attribute(.backgroundColor, at: index, effectiveRange: nil) as? UIColor {
        XCTAssertTrue(HighlightTextViewTests.minColor == color, "testEmojiTextCharactersMinColor2 at:\(index) text:\(text)")
      }
    }
  }
  
  func testEmojiTextCharactersNonColor() {
    
    textView.text = createEmojiText(charactersCount: 10)
    setCondition()
    
    textView.text.enumerated().forEach { index, _ in
      if let color = textView.attributedText.attribute(.backgroundColor, at: index, effectiveRange: nil) as? UIColor {
        XCTAssertTrue(UIColor.clear == color, "testEmojiTextCharactersNonColor")
      }
    }
  }
  
  func testEmojiTextCharactersNonColor2() {
    
    textView.text = createEmojiText(charactersCount: 99)
    setCondition()
    
    textView.text.enumerated().forEach { index, _ in
      if let color = textView.attributedText.attribute(.backgroundColor, at: index, effectiveRange: nil) as? UIColor {
        XCTAssertTrue(UIColor.clear == color, "testEmojiTextCharactersNonColor2")
      }
    }
  }
  
  func testEmojiTextCharactersNonColor3() {
    
    textView.text = createEmojiText(charactersCount: 100)
    setCondition()
    
    textView.text.enumerated().forEach { index, _ in
      if let color = textView.attributedText.attribute(.backgroundColor, at: index, effectiveRange: nil) as? UIColor {
        XCTAssertTrue(UIColor.clear == color, "testEmojiTextCharactersNonColor3")
      }
    }
  }
  
  func testEmojiTextCharactersMaxColor() {
    
    textView.text = createEmojiText(charactersCount: 101)
    setCondition()
    
    textView.text.enumerated().forEach { index, _ in
      if let color = textView.attributedText.attribute(.backgroundColor, at: index, effectiveRange: nil) as? UIColor {
        if index < HighlightTextViewTests.rangeMax {
          XCTAssertTrue(UIColor.clear == color, "testEmojiTextCharactersMaxColor")
        }
        else {
          XCTAssertTrue(HighlightTextViewTests.maxColor == color, "testEmojiTextCharactersMaxColor")
        }
      }
    }
  }
}

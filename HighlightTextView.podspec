Pod::Spec.new do |spec|

  spec.name         = "HighlightTextView"
  spec.version      = "0.6.0"
  spec.summary      = "Highlight TextView."
  spec.homepage     = "https://github.com/yusayusa/HighlightTextView"
  spec.license      = "MIT"
  spec.author             = { "yusayusa" => "yusakzk@gmail.com" }
  spec.swift_version = "5.0"
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/yusayusa/HighlightTextView.git", :tag => "#{spec.version}" }
  spec.source_files = ['HighlightTextView/**/*.{swift,h}']
end

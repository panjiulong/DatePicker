#
# Be sure to run `pod lib lint DatePicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DatePicker'
  s.version          = '0.1.1'
  s.summary          = 'DatePicker is a three-tier interactive date selection component based on UIPickerView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    DatePicker is a three-tier interactive date selection component based on UIPickerView. It can customize the UI, set start and end dates, and set selected dates.
                       DESC

  s.homepage         = 'https://github.com/panjiulong/DatePicker.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'panjiulong' => 'jiulongpan@gmail.com' }
  s.source           = { :git => 'https://github.com/panjiulong/DatePicker.git', :tag => s.version.to_s }
s.social_media_url = 'https://www.jianshu.com/u/a8601fa19a75'

  s.ios.deployment_target = '9.0'

  s.source_files = 'DatePicker/Classes/**/*'
  s.swift_version = '4.2'
  
  # s.resource_bundles = {
  #   'DatePicker' => ['DatePicker/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

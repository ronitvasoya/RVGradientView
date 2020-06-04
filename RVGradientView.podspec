#
# Be sure to run `pod lib lint RVGradientView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RVGradientView'
  s.version          = '0.1.0'
  s.summary          = 'This is some super GradientView that was made by Ronit Vasoya'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'This is an amazing GradientView. you make easily gradient view and easily modify your gradient view'
                       DESC

  s.homepage         = 'https://github.com/ronitvasoya/RVGradientView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ronitvasoya' => 'vasoyaronit@gmail.com' }
  s.source           = { :git => 'https://github.com/ronitvasoya/RVGradientView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  
  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'
  s.platforms = {
      "ios": "10.0"
  }
  
  # s.resource_bundles = {
  #   'RVGradientView' => ['RVGradientView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

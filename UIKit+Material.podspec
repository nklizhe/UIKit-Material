#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "UIKit+Material"
  s.version          = "0.1.2"
  s.summary          = "A collection of UIKit categories for Material Design"
  s.description      = <<-DESC
                       A collection of UIKit categories for creating UI with Material Design. http://www.google.com/design/spec/material-design/introduction.html


                       * `UIColor+Material.h` - color palette of Material design
                       * `UIFont+Material.h` - Bundle the Roboto fonts
                       DESC
  s.homepage         = "https://github.com/nklizhe/UIKit-Material"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Tom Li" => "nklizhe@gmail.com" }
  s.source           = { :git => "https://github.com/nklizhe/UIKit-Material.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/nklizhe'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundle = { 'Roboto' => 'Pod/Assets/Fonts/*.ttf' }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

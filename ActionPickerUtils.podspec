#
# Be sure to run `pod lib lint ActionPickerUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ActionPickerUtils'
  s.version          = '7.0.0'
  s.summary          = 'Utils global functions to simplify working with ActionSheetPicker-3.0'
  
  s.description      = <<-DESC
Utils global functions to simplify working with ActionSheetPicker-3.0.
User `g_showDatePicker` for date picker and `g_showStringsPicker` for strings picker.
                       DESC

  s.homepage         = 'https://github.com/APUtils/ActionPickerUtils'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Anton Plebanovich' => 'anton.plebanovich@gmail.com' }
  s.source           = { :git => 'https://github.com/APUtils/ActionPickerUtils.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_versions = '5.1'

  s.source_files = 'ActionPickerUtils/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ActionPickerUtils' => ['ActionPickerUtils/Assets/*.png']
  # }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation', 'UIKit'
  s.dependency 'ActionSheetPicker-3.0', '~> 2.5'
end

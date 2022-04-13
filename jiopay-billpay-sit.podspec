
#
# Be sure to run `pod lib lint jiopay-billpay-sit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'jiopay-billpay-sit'
    s.version          = '1.0.0'
    s.summary          = 'Pay Your Bill using Jio-Bill-Pay integrated with Jio Payment Gateway.'
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
    s.description      = <<-DESC
  A cocoa-pod library for paying online bills using Jio Payment Gateway.
  An explanatory example folder has been attached for implementation walk around!
                         DESC
  
    s.homepage         = 'https://github.com/jiopay/jiopay-billpay-sit'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Jio Platforms Ltd.' => 'rkrkrishavkumar3796@gmail.com' }
    s.source           = { :git => 'https://github.com/jiopay/jiopay-billpay-sit.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/Rishav__kumar_'
  
    s.ios.deployment_target = '11.0'
    s.swift_version = '4.2'
  
    s.source_files = 'jiopay-billpay-sit/jiopay-billpay-sit/JioBillPayments.swift'
  
    # s.resource_bundles = {
    #   '${POD_NAME}' => ['${POD_NAME}/Assets/*.png']
    # }
  
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
  end
  
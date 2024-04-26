source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'testPodTr111' do
    pod 'YYKit'
    pod 'CTMediator'
pod 'Masonry', '~> 1.1.0'
end
post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
               end
          end
   end
end


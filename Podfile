source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'testPodTr111' do
    pod 'CRBoxInputView', '1.2.1'
#    pod 'YZAuthID'
    pod 'LLNestedTableView'
    pod 'SnapKit', '~> 4.0.0'
    pod 'Masonry', '~> 1.1.0'
    pod 'TTTAttributedLabel', '~> 2.0.0'
    pod 'MJExtension', '~> 3.0.17'
    pod 'EGOCache', '~> 2.1.3'
#   pod 'ReactiveObjC', '~> 3.1.1'
    pod 'ReactiveCocoa', '~> 2.5'
    pod 'FMDB', '~> 2.7.2'
#   pod 'Bolts', '~> 1.8.4'
    pod 'CocoaAsyncSocket', '~> 7.6.1'
#   pod 'MLeaksFinder', '~> 1.0.0'
    pod 'SDWebImage', '~> 4.0' 
    pod 'FLAnimatedImage', '~> 1.0'
    pod 'FLEX', '~> 3.1.2',:configurations => ['Debug']
    pod 'LookinServer', :configurations => ['Debug']
#   pod 'MJRefresh', '~> 3.1.15'
#   集成UMeng的第三方登录和分享
    pod 'JWT'
    pod 'UMCAnalytics', '~> 6.1.0'
    pod 'UMCSecurityPlugins', '~> 1.0.6'
    pod 'UMCCommon', '~> 2.1.4'
    pod 'UMCShare/Social/ReducedWeChat', '~> 6.9.8' 
    pod 'UMCShare/Social/ReducedQQ', '~> 6.9.8' 
    pod ‘UMCShare/Social/ReducedSina', '~> 6.9.8'
    pod 'Bugly'
    pod 'YYKit'
    pod 'JPush', '~> 3.2.1'
    pod 'lottie-ios', '~> 3.1.8'
    
    pod 'Charts', '~> 3.5.0'
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


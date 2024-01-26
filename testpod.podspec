Pod::Spec.new do |s|
  s.name             = 'testpod' 
  s.version          = '1.0.0'
  s.summary          = 'test pod.'
  s.description      = 'test pod...'
  
  s.homepage         = 'https://github.com/fanfang01/testpod.git'
  s.license          = "MIT"
  s.author           = { 'Tracy Fan' => '375747625@qq.com' }

  s.source           = { :git => 'https://github.com/fanfang01/testpod.git', :tag => '1.0.0' }
  
  s.requires_arc = true
  s.ios.deployment_target = '9.0'

  s.source_files = 'Source/*.{h,m}'
  
end

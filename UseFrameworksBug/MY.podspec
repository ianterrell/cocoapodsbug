

Pod::Spec.new do |s|
  s.name = "MY"
  s.version = '1.0.0'
  s.homepage = 'https://developer.foobar.com'

  s.summary = 'Sample to show a dependency bug.'
  s.description = 'Grits!.'

  s.platform = :ios, '8.0'
  s.requires_arc = true
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
     core.source_files = 'Pods/Core/**/*.{h,m}', 'Pods/Core/**/*.{h,m}'
     core.dependency 'MY/MyBacon'
  end

  s.subspec 'MyBacon' do |ba|
    ba.source_files = 'Pods/MyBacon/**/*.{h,m}'
  end

  s.subspec 'MySubspec' do |ads|
    ads.source_files = 'Pod/BVAdvertising/**/*.{h,m}'
    # Big ol' workarounds
    ads.pod_target_xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(PODS_ROOT)/Google-Mobile-Ads-SDK/GoogleMobileAdsSdkiOS-7.6.0' }
    ads.framework = 'GoogleMobileAds'
    ads.dependency 'MY/Core'
  end



end

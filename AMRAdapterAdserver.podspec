Pod::Spec.new do |s|
  s.name             = 'AMRAdapterAdserver'
  s.version          = '1.1.5.2'
  s.license          = { :type => 'Copyright', :text => <<-LICENSE
                            Copyright 2016
                            Admost Mediation Limited.
                            LICENSE
                            }
  s.homepage         = 'http://www.admost.com/'
  s.author           = { 'Admost Mediation Limited' => 'amr@admost.com' }
  s.summary          = 'Adserver adapter for AMR SDK.'
  s.description      = 'AMR Adserver adapter allows publishers to mediate Adserver banner, native, interstitial and video ads in AMRSDK.'

  s.source           = { :git => 'https://github.com/admost/AMR-IOS-ADAPTER-ADSERVER.git',
                 :tag => s.version.to_s
                }
  s.documentation_url = 'https://admost.github.io/amrios/'
  s.platform      = :ios
  s.ios.deployment_target = '10.0'
  s.swift_versions = ['5']
  s.vendored_frameworks = 'AMRAdapterAdserver/Libs/AMRAdapterAdserver.xcframework', 'AMRAdapterAdserver/Libs/AdmostAdServer.xcframework'
  s.resources = ['AMRAdapterAdserver/Resources/AdmostAdServerResources.bundle']
  s.pod_target_xcconfig = { 
    'OTHER_LDFLAGS' => '-ObjC',
    "VALID_ARCHS": "arm64 armv7 x86_64",
    'VALID_ARCHS[sdk=iphoneos*]' => 'armv7 arm64',
    'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64 arm64'
  }
  s.dependency 'AMRSDK', '~> 1.5.50'
end

Pod::Spec.new do |s|
s.name         = "SimpleOverlay"
s.version      = "1.0.0"
s.summary      = "SimpleOverlay is a swifty solution that helps you walk through your users when faced with stuff that is not obvious rightaway."
s.description = "SimpleOverlay is a super simple class inheriting from UIView provided to you as a framework that helps simple walkthroughs to direct users when withing your app."
s.authors    = { "Deyan Aleksandrov" => "deyanaaleksandrov@gmail.com", "Gavril Tonev" => "gtonev@centroida.co" }
s.homepage     = "https://github.com/Centroida/SimpleOverlay"
s.license      = "MIT"
s.platform     = :ios, "9"
s.source       = { :git => "https://github.com/Centroida/SimpleOverlay.git", :tag => "#{s.version}" }
s.source_files = "SimpleOverlay", "SimpleOverlay/SimpleOverlay/**/*.{h,swift}"
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }
end

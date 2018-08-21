Pod::Spec.new do |s|
   s.name = 'MCChatModule'
   s.version = '1.0.0'
   s.license = { :type => "MIT", :file => "LICENSE.md" }

   s.summary = 'A simple chat module to integrate with your app.'
   s.homepage = 'https://github.com/marcocapano/MCChatModule'
   s.social_media_url = 'https://twitter.com/marcocapano1'
   s.author = { "Marco Capano" => "marco24capano@icloud.com" }

   s.source = { :git => 'https://github.com/marcocapano/MCChatModule.git', :tag => s.version }
   s.source_files = 'Sources/**/*'

   s.pod_target_xcconfig = {
      "SWIFT_VERSION" => "4.0",
   }

   s.ios.deployment_target = '11.0'
   s.requires_arc = true
end

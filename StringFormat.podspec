Pod::Spec.new do |s|
  s.name = 'StringFormat'
  s.module_name = 'StringFormat'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'StringFormat'
  s.homepage = 'https://github.com/coderyi/StringFormat'
  s.authors = { 'coderyi' => 'coderyi@163.com' }
  s.source = { :git => 'https://github.com/coderyi/StringFormat.git', :tag => "v#{s.version}" }
  s.swift_version = '5.0'
  s.ios.deployment_target = '8.0'
  s.source_files = 'StringFormat/StringFormat/*.swift'
end

Pod::Spec.new do |s|
  s.name = 'SwiftObservable'
  s.version = '0.0.3'
  s.license = 'MIT'
  s.summary = 'Easy Swift utility which makes Observing values a breeze.'
  s.homepage = 'https://github.com/Valerio69/SwiftObservable'
  s.authors = 'Valerio69'
  s.source = { :git => 'https://github.com/Valerio69/SwiftObservable', :tag => s.version }
  # s.documentation_url = ''

  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '11.0'
  s.watchos.deployment_target = '4.0'

  s.swift_versions = ['5.1']

  s.source_files = 'Sources/*.swift'
end

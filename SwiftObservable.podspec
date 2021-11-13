Pod::Spec.new do |s|
  s.name = 'SwiftObservable'
  s.version = '0.0.7'
  s.license = 'MIT'
  s.summary = 'Easy Swift utility which makes Observing values a breeze.'
  s.homepage = 'https://github.com/vetrek/SwiftObservable'
  s.author   = { 'Valerio Sebastianelli' => 'valerio.alsebas@gmail.com' }
  s.authors = 'Valerio'
  s.source = { :git => 'https://github.com/vetrek/SwiftObservable.git', :tag => s.version }

  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '11.0'
  s.watchos.deployment_target = '4.0'

  s.swift_versions = ['5.0']

  s.source_files = 'Sources/*.swift'
end


# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'motion-frank'
  s.version     = '1.1.8.0'
  s.summary     = 'Frank integration for RubyMotion projects'
  s.description = 'motion-frank provides easy integration of frank-cucumber for in-simulator testing'
  s.author      = 'Paul Infield-Harm'
  s.email       = 'pinfield-harm@cyrusinnovation.com'
  s.add_dependency 'frank-cucumber', '1.1.8'

  files = []
  files << 'README.md'
  files << 'LICENSE'
  files.concat(Dir.glob('lib/**/*.rb'))
  s.files = files
end
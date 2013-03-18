# -*- encoding: utf-8 -*-

Version = '0.0.1'

Gem::Specification.new do |s|
  s.name        = "motion-frank"
  s.version     = Version
  s.summary     = "Frank integration for RubyMotion projects"
  s.description = "motion-frank provides easy integration of frank-cucumber for in-simulator testing"
  s.author      = 'Paul Infield-Harm'
  s.email       = 'pinfield-harm@cyrusinnovation.com'

  files = []
  files << 'README.rdoc'
  files << 'LICENSE'
  files.concat(Dir.glob('lib/**/*.rb'))
  s.files = files
end
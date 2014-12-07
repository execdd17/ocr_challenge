$:.unshift File.expand_path('../lib', __FILE__)

require 'ocr_challenge/version'

Gem::Specification.new do |s|
  s.name = 'ocr_challenge'
  s.version = OcrChallenge::VERSION
  s.authors = ['Alexander Vanadio']
  s.email = 'execdd17@gmail.com'
  s.homepage = 'https://github.com/execdd17/ocr_challenge'
  s.summary = 'A solution to the challenge here: http://www.asymmetrik.com/programming-challenges/business-card-ocr.html'
  s.description = 'This gem allows you to parse text blobs to find names, email addresses, and phone numbers'
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ['lib']
  s.add_development_dependency('rspec', '~> 2.99')
  s.add_development_dependency('simplecov', '~> 0.9')
  s.add_development_dependency('faker', '~> 1.4')
  s.license = 'MIT'
end
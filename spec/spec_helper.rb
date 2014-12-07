require 'simplecov'

SimpleCov.start do
  add_filter "/spec/"
end

RSpec.configure do |config|
  config.tty = true
  config.color = true
end

require 'faker'
require 'ocr_challenge'
include OcrChallenge

SAMPLE_SIZE = 1_000
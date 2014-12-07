require 'simplecov'

SimpleCov.start do
  add_filter "/spec/"
end

RSpec.configure do |config|
  config.tty = true
  config.color = true
end

require 'ocr_challenge'
require 'faker'

include OcrChallenge

SAMPLE_SIZE = 1_000
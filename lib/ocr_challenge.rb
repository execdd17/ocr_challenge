$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

# the project namespace
module OcrChallenge; end

require 'ocr_challenge/ten_digit_telecom_parser'
require 'ocr_challenge/land_and_cell_number_parser'
require 'ocr_challenge/name_parser'
require 'ocr_challenge/email_parser'
require 'ocr_challenge/i_contact_info'
require 'ocr_challenge/i_business_card_parser'

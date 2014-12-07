$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib/ocr_challenge'))

require 'ocr_challenge/i_contact_info'
require 'ocr_challenge/i_business_card_parser'

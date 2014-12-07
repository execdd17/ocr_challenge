# This module attempts to parse phone numbers which I w ill define as
# BOTH land lines and cell phone numbers. It will attempt to filter out fax numbers
# NOTE: This assumes the including class will have a 'lines' instance variable
module OcrChallenge::LandAndCellNumberParser
  include OcrChallenge::TenDigitTelecomParser

  FAX_REGEX = /fax/i

  def get_phone_numbers
    matching_lines = get_matches

    phone_number_lines = matching_lines.reject do |line|
      is_fax_number?(line)
    end

    phone_number_lines.map do |line|
      format(line, '-')
    end.sort
  end

  private

  def is_fax_number?(line)
    line =~ FAX_REGEX
  end
end
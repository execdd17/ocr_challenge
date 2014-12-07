module TenDigitTelecomParser

  # this will find phone numbers that are grouped in 3 parts (3-3-4)
  # regardless of what is in between.
  BASIC_NUMBER_REGEX = /[\d]{3}[^\d]*[\d]{3}[^\d]*[\d]{4}/

  def get_matches
    @lines.select do |line|
      line =~ BASIC_NUMBER_REGEX
    end
  end

  private

  # remove every character that isn't a number
  def scrub_line(line)
    line.gsub!(/[^\d]/, '')
  end

  def format(line, delimiter)
    line = scrub_line(line)
    line[(0..2)] + delimiter + line[(3..5)] + delimiter + line[(6..9)]
  end
end

# This module attempts to parse phone numbers which I w ill define as
# BOTH land lines and cell phone numbers. It will attempt to filter out fax numbers
# NOTE: This assumes the including class will have a 'lines' instance variable
module LandAndCellNumberParser
  include TenDigitTelecomParser

  FAX_REGEX = /fax/i

  # NOTE: the programming challenge does not take into account that a contact
  # can have multiple phone numbers. This method will return the FIRST phone
  # number
  def get_phone_number
    matching_lines = get_matches

    phone_number_lines = matching_lines.reject do |line|
      is_fax?(line)
    end

    phone_number_lines.map do |line|
      format(line, '-')
    end.sort.first
  end

  private

  def is_fax?(line)
    line =~ FAX_REGEX
  end
end

class OcrChallenge::IBusinessCardParser
  include LandAndCellNumberParser

  def initialize(document)
    @lines = document.split("\n")
    self
  end

  def self.get_contact_info(document)
    parser = self.new(document)
    IContactInfo.new(parser)
  end
end
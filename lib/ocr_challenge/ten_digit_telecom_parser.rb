# This will find numbers that are grouped in 3 chunks of consecutive numbers,
# with chunk sizes of 3, 3, and 4 respectively, regardless of what is in
# between the chunks. An example is (234) 435-3567
module OcrChallenge::TenDigitTelecomParser

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
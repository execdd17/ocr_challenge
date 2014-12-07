# This will find numbers that are grouped in 3 chunks of consecutive numbers,
# with chunk sizes of 3, 3, and 4 respectively, regardless of what is in
# between the chunks. It will also accept a leading 1.
# An example is 1-(234) 435-3567
module OcrChallenge::BasicTenDigitTelecomParser

  BASIC_NUMBER_REGEX = /([1][^\d]*)?[\d]{3}[^\d]*[\d]{3}[^\d]*[\d]{4}/

  def get_matches
    lines.select do |line|
      line =~ BASIC_NUMBER_REGEX
    end
  end

  private

  # remove every character that isn't a number, and leading 1 if present
  def scrub_line(line)
    line.gsub!(/[^\d]/, '')
    line.size == 11 ? line[(1..-1)] : line
  end

  def format(line, delimiter)
    line = scrub_line(line)
    line[(0..2)] + delimiter + line[(3..5)] + delimiter + line[(6..9)]
  end
end
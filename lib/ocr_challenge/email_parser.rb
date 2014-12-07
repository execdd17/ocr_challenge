module OcrChallenge::EmailParser

  # taken from: http://www.regular-expressions.info/email.html
  EMAIL_REGEX = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i

  def get_email_addresses
    @lines.inject(Array.new) do |email_addresses, line|
      line = line.strip

      if offset = line =~ EMAIL_REGEX
        email_addresses << line[(offset..-1)]
      end

      email_addresses
    end.sort
  end

end
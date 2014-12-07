class OcrChallenge::IContactInfo

  def initialize(parser)
    @parser = parser
  end

  def get_name
    @parser.parse_names("/home/alex/git_repos/ocr_challenge/names").first
  end

  # NOTE: the programming challenge does not account for multiple email addresses,
  # so I take the first one
  def get_email_address
    @parser.parse_email_addresses.first
  end

  # NOTE: the programming challenge does not take into account that a contact
  # can have multiple phone numbers, so I take the firs one
  def get_phone_number
    @parser.parse_phone_numbers.first
  end
end
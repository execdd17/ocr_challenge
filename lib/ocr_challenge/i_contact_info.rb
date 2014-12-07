class OcrChallenge::IContactInfo

  def initialize(parser)
    @parser = parser
  end

  #TODO: switch this to use ghost methods
  def get_name
    @parser.get_name
  end

  def get_email_address
    @parser.get_email_address
  end

  def get_phone_number
    @parser.get_phone_number
  end
end
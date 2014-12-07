class OcrChallenge::IContactInfo

  attr_reader :name, :email_addresses, :phone_numbers

  def initialize(parser, list_of_names_dir='names')
    @parser           = parser
    @name             = @parser.parse_names(list_of_names_dir)
    @email_addresses  = @parser.parse_email_addresses
    @phone_numbers    = @parser.parse_phone_numbers
  end

  def get_name
    "Name: #{name}"
  end

  # NOTE: the programming challenge does not account for multiple email addresses,
  # so I take the first one
  def get_email_address
    "Email: #{email_addresses.first}"
  end

  # NOTE: the programming challenge does not take into account that a contact
  # can have multiple phone numbers, so I take the firs one
  def get_phone_number
    "Phone: #{phone_numbers.first}"
  end

  def to_s
    [get_name, get_email_address, get_phone_number].join("\n")
  end

end
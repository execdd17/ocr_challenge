class OcrChallenge::IContactInfo

  attr_reader :names, :email_addresses, :phone_numbers

  def initialize(parser, list_of_names_dir='names')
    @parser           = parser
    @names            = @parser.parse_names(list_of_names_dir)
    @email_addresses  = @parser.parse_email_addresses
    @phone_numbers    = @parser.parse_phone_numbers
  end

  # NOTE: perhaps unlikely, but a business card may have more than one name. For
  # example, maybe there were multiple points of contact for a given company card.
  # Since the challenge did not specify, I take the first one.
  def get_name
    "Name: #{names.first}"
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
    contact_as_string = ""

    {Name: names, Email: email_addresses,
     "Phone Number" => phone_numbers}.each_pair do |label, values|

      values.each do |value|
        contact_as_string << "#{label}: #{value}\n"
      end
    end

    contact_as_string
  end

end
require 'i_contact_info'

class IBusinessCardParser
  def self.get_contact_info(document)
    lines = document.split("\n")
    IContactInfo.new(lines)
  end
end
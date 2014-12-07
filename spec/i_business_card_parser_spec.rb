require 'spec_helper'

describe IBusinessCardParser do

  let(:full_name)  { " Alexander Vanadio \n" }
  let(:email)      { " execdd17@gmail.com \n" }
  let(:phone)      { " 410.349.7308 \n" }
  let(:blank_line) { " \n" }

  # TODO: document 10 number assumption

  describe '.get_contact_info' do
    it 'returns an IContactInfo' do
      result = IBusinessCardParser.get_contact_info(blank_line +
        full_name + email + phone + blank_line)

      result.is_a?(IContactInfo).should be true
    end
  end
end
require 'spec_helper'

describe IContactInfo do

  let(:full_name)  { " Alexander Vanadio \n" }
  let(:email)      { " execdd17@gmail.com \n" }
  let(:phone)      { " 410.349.7308 \n" }
  let(:blank_line) { " \n" }

  subject {
    parser = IBusinessCardParser.new(blank_line + full_name + email + phone + blank_line)
    IContactInfo.new(parser)
  }
  #
  it 'returns the correct name' do
    subject.get_name.should eq "Name: Alexander Vanadio"
  end

  it 'returns the correct email' do
    subject.get_email_address.should eq "Email: execdd17@gmail.com"
  end

  it 'returns the correct phone number' do
    subject.get_phone_number.should eq "Phone: 410-349-7308"
  end
end
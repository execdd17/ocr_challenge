class OcrChallenge::IBusinessCardParser
  include OcrChallenge::BasicLandAndCellNumberParser
  include OcrChallenge::EmailParser
  include OcrChallenge::NameParser

  def self.get_contact_info(document)
    parser = new(document)
    IContactInfo.new(parser)
  end

  def initialize(document)
    @lines = document.split("\n").reject { |line| line.empty? }
  end

  private

  attr_reader :lines
end
class OcrChallenge::IBusinessCardParser
  include OcrChallenge::LandAndCellNumberParser
  include OcrChallenge::EmailParser
  include OcrChallenge::NameParser

  def initialize(document)
    @lines = document.split("\n").reject { |line| line.empty? }
  end

  def self.get_contact_info(document)
    parser = self.new(document)
    IContactInfo.new(parser)
  end

  private

  attr_reader :lines
end
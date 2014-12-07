require 'pathname'

# It turns out that identifying names in a blob of text is hard. I decided to
# use a dictionary of names in combination with eliminating lines with digits.
module OcrChallenge::NameParser

  def parse_names(dir_path)

    #TODO: catch IO exception
    names_dir = Pathname.new(dir_path)
    name_files= names_dir.children

    preprocessed_lines = @lines.map(&:strip).reject do |line|
      line =~ /\d/    # names shouldn't have digits in them
    end

    # compare the current line with all the names available in the name files
    preprocessed_lines.select do |line|
      name_files.any? do |file|
        name_lines = file.readlines
        name_lines.any? do |name_line|
          line.downcase =~ Regexp.new(name_line.chop)
        end
      end
    end
  end
end
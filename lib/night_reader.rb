require "./lib/key"
require "./lib/fileio"

class NightReader
  include Key

  def read
    file = ARGV[0]
    braille_message = File.read(file).chomp
  end

  def encode_to_english
    split_message = braille_message.split
    each_character = split_message.map do |characters|
      characters.split("")
    end

    top, middle, bottom = each_character
    result = []

    until top.empty?
      result << [top.shift(2).join, middle.shift(2).join, bottom.shift(2).join]
    end
    ENGLISH = result.map do |word|
      whole_word = []
        whole_word.join << braille.output_english(word)
    end
    writing
  end

  def writing
    output = File.open(ARGV[1], 'w')
    output.write(ENGLISH.join)
  end
end


output_file = FileWriter.new
output_file.read
output_message = output_file.output_to_english

# puts "Created '#{ARGV[1]}' with #{output_message} characters"

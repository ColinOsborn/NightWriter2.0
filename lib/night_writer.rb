require "./lib/key"
require "./lib/fileio"

class NightWriter
  include Key


  def encode_to_braille(input)
    line1 = []
    line2 = []
    line3 = []
    input.chars.map do |char|
      line1 << BRAILLE[char][0]
      line2 << BRAILLE[char][1]
      line3 << BRAILLE[char][2]
    end
    this = "\n"
    line1.join + this + line2.join + this + line3.join
  end
end


if __FILE__ == $0
  english = read(input)
  night_writer = NightWriter.new
  braille = night_writer.encode_to_braille(english.chomp)
  File.write("braille.txt", braille)
end
# puts "Created '#{ARGV[1]}' with #{output_message} characters"

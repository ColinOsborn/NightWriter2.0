require "./lib/key"

class NightWriter
include BRAILLE

  def encode_to_braille(input)
    line1 = []
    line2 = []
    line3 = []
    input.chars.map do |char|
      line1 << CHARACTERS[char][0]
      line2 << CHARACTERS[char][1]
      line3 << CHARACTERS[char][2]
    end
    this = "\n"
    line1.join + this + line2.join + this + line3.join
  end
end

end

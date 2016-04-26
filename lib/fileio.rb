class Fileio

  def read
    filename = ARGV[0]
    file = File.read(filename)
    encode_braille_to_english(file)
  end

  def write

  end

end

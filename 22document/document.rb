class Document
  def initialize(filename)
    @filename = filename
  end

  def read
    File.read(@filename)
  end

  def write(input)
    File.write(@filename, input, mode: "w")
  end

  def add(input)
    File.write(@filename, input, mode: "a")
  end

  def size
    File.size(@filename)
  end

  def lines_count
    n_lines = 0
    File.foreach(@filename) { n_lines += 1 }
    n_lines
  end

  def words_count
    n_words = 0
    File.foreach(@filename) do |line|
      line.chomp.each_char { n_words += 1 }
    end
    n_words
  end
end

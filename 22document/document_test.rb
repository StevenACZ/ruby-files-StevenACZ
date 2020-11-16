require "minitest/autorun"
require_relative "document"

class DocumentTest < Minitest::Test
  def test_can_write_to_new_file
    # skip
    filename= "test.txt"
    File.delete(filename) if File.exist?(filename)

    doc = Document.new(filename)
    input = "Hello World!"
    doc.write(input)
    assert_equal input, File.read(filename)
  end

  def test_can_read_from_file
    skip
    filename= "test.txt"
    input = "Hello World!"
    File.open(filename, "w") { |file| file.write input }

    doc = Document.new(filename)
    assert_equal input, doc.read
  end

  def test_can_add_new_text
    skip
    filename= "test.txt"
    input = "Hello World!\n"
    newline = "New line!"
    File.open(filename, "w") { |file| file.write input }

    doc = Document.new(filename)
    doc.add(newline)
    assert_equal (input + newline), File.read(filename)
  end

  def test_can_ask_for_file_size
    skip
    filename= "test.txt"
    input = "Hello World!"
    File.open(filename, "w") { |file| file.write input }

    doc = Document.new(filename)
    assert_equal input.size, doc.size
  end

  def test_can_ask_for_lines_count
    skip
    filename= "test.txt"
    input = "Line 1\nLine 2\nLine 3\nLine 4\n"
    File.open(filename, "w") { |file| file.write input }

    doc = Document.new(filename)
    assert_equal 4, doc.lines_count
  end

  def test_can_ask_for_words_count
    skip
    filename= "test.txt"
    input = "The first line has 6 words\nThe second only 4\n"
    File.open(filename, "w") { |file| file.write input }

    doc = Document.new(filename)
    assert_equal 10, doc.words_count
  end
end

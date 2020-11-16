$LOAD_PATH.unshift("./23writer")

require_relative "../lib/io_test_helpers"
require "minitest/autorun"

class WriterTest < Minitest::Test
  include IoTestHelpers

  def test_write_file
    # skip
    input = ["Line 1", "Line 2", "Line 3", ":exit"]
    _output, _error = capture_io do
      simulate_stdin(*input) do
        ARGV.concat ["write", "test.txt"]
        load "writer.rb"
      end
    end

    assert_equal input[0..-2].join("\n"), File.read("test.txt").chomp
  end

  def test_read_file
    skip
    text = "Test1\nTest2\nTest3\n"
    File.open("test.txt", "w") { |file| file.write text }
    output, _error = capture_io do
      ARGV.concat ["read", "test.txt"]
      load "writer.rb"
    end

    assert_equal text, output
  end

  def test_add_new_line_to_file
    skip
    text = "Test1\nTest2\nTest3\n"
    File.open("test.txt", "w") { |file| file.write text }
    new_line = ["Test4", ":exit"]
    _output, _error = capture_io do
      simulate_stdin(*new_line) do
        ARGV.concat ["add", "test.txt"]
        load "writer.rb"
      end
    end

    assert_equal "Test1\nTest2\nTest3\nTest4\n", File.read("test.txt")
  end

  def test_ask_for_size
    skip
    text = "Test1\nTest2\nTest3\n"
    File.open("test.txt", "w") { |file| file.write text }
    output, _error = capture_io do
      ARGV.concat ["size", "test.txt"]
      load "writer.rb"
    end

    assert_equal "test.txt size: 18 bytes\n", output
  end

  def test_ask_for_lines
    skip
    text = "Test1\nTest2\nTest3\n"
    File.open("test.txt", "w") { |file| file.write text }
    output, _error = capture_io do
      ARGV.concat ["lines_count", "test.txt"]
      load "writer.rb"
    end

    assert_equal "test.txt has 3 lines\n", output
  end

  def test_ask_for_words
    skip
    text = "Test1\nTest2\nTest3\n"
    File.open("test.txt", "w") { |file| file.write text }
    output, _error = capture_io do
      ARGV.concat ["words_count", "test.txt"]
      load "writer.rb"
    end

    assert_equal "test.txt has 3 words\n", output
  end
end
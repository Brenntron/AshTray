require_relative "../test_helper"

class AddingANewCigarTest < Minitest::Test

  def test_happy_path_adding_a_cigar
    shell_output    = ""
    expected_output = main_menu
    IO.popen('./ash_tray', 'r+') do |pipe|
      pipe.puts "1"
      expected_output << "Who made the cigar?\n"
      pipe.puts "1558"
      expected_output << "What is the name of the cigar?\n"
      pipe.puts "Ruby"
      expected_output << "What is the length of the cigar?\n"
      pipe.puts "5\"6\'"
      expected_output << "What is the ring gauge?\n"
      pipe.puts "50"
      expected_output << "1558 Ruby 5\"6' 50 has been added\n"
      expected_output << "1. Add a cigar\n2. List cigars\n3. Add a rating\n4. Delete a cigar\n5. Exit\n"
      pipe.puts "5"
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end
end

require_relative "../test_helper"

class AddingANewScenarioTest < Minitest::Test

  def test_happy_path_adding_a_cigar
    shell_output    = ""
    expected_output = main_menu
    test_cigar      = "Ruby 1558"
    IO.popen('./ash_tray manage', 'r+') do |pipe|
      pipe.puts "1"
      expected.output << "Cigar name?\n"
      pipe.puts test_cigar
      expected_output << "\"#{test_cigar}\" has been added\n"
      expected_output << main_menu
      pipe.puts "2"
      expected_output << "1. #{test_cigar}\n"
      shell_output = pipe.read
      pipe.close_write
      pipe.close_rease
    end
    assert_equal expected_output, shell_output
  end

  def test_sad_path_adding_a_cigar
    skip
  end
end

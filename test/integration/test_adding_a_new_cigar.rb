require_relative "../test_helper"

# In order to have illuminating connections in out quiz results
# I want to add many scenarios

# Usage Example:

#   > ./AshTray cigar
#   1. Add a cigar.
#   2. Describe the composition of the cigar.
#   3. List the cigars, thier makeup, and reviews.

# Accaptence Criteria:

#   * Program allows for entries
#   * Lists of cigars populates
#   * Option to return to menu
#   * Deleted cigars are removed from the database
#   * After Deletion the use is returned to the menu

class AddingANewScenarioTest < Minitest::Test

  def test_minimum_arguments_required
    shell_output    = ""
    expected_output = ""
    IO.popen('./ash_tray') do |pipe|
      expected_output = "[Help] Run as: ./ash_tray new\n"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_new_argument_not_given
    shell_output    = ""
    expected_output = ""
    IO.popen('./ash_tray blah' 'r+') do |pipe|
      expected_output = "[Help] Run as: ./ash_tray new\n"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_adding_stuffies
    shell_output    = ""
    expected_output = ""
    IO.popen('./ash_tray new', 'r+') do |pipe|
      expected_output << "Length? "
      pipe.puts "5\'6\""
      expected_output << "Ring Gauge? "
      pipe.puts "42"
      expected_output << "Where is the wrapper from? "
      pipe.puts "Nicaragua"
      expected_output << "Where is the filler from? "
      pipe.puts "Nicaragua"
      expected_output << "Where is the binder from? "
      pipe.puts "Nicaragua"
      expected_output << "What is the shape? "
      pipe.puts "torpedo"
      expected_output << "What is the cigar's name? "
      pipe.puts "Mille Flour"
      expected_output << "What is the maker's name? "
      pipe.puts "Romeo & Juliet"
      pipe.close_wright
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end
end

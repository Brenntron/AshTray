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

class AddingANewScenarioTest < Minitest:Test

  def test_minimum_arguments_required
    shell_output    = ""
    expected_output = ""
    IO.popen('./ash_tray') do |pipe|
      expected_output = "[Help] Run as: ./ash_tray new"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

end

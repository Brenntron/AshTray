class BasicUsageTest < Minitest::Test
  def test_no_argument_given
    shell_output    = ""
    expected_output = ""
    IO.popen('./ash_tray', 'r+') do |pipe|
      expected_output = <<EOS
1. Add a cigar
2. List cigars
3. Add a rating
4. Delete a cigar
5. Exit
EOS
      pipe.puts "5"
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end

  def unneccesary_argument
    shell_output    = ""
    expected_output = ""
    IO.popen('./ash_tray blah') do |pipe|
      expected_output = "[HELP] No argument necessary."
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end

  def test_open_then_exit
    skip
    shell_output    = ""
    expected_output = ""
    IO.popen('./ash_tray') do |pipe|
      expected_output = <<EOS
1. Add a cigar
2. List cigars
3. Add a rating
4. Delete a cigar
5. Exit
EOS
      pipe.puts "5"
      expected_output << "5\n"
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end
end

class BasicUsageTest < Minitest::Test
  def test_new_argument_given
    shell_output    = ""
    expected_output = ""
    IO.popen('./ash_tray manage', 'r+') do |pipe|
      expected_output = <<EOS
1. Add a cigar
2. Edit a cigar
3. Exit
EOS
      pipe.puts "3"
      expected_output << "Peace Out!\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end
end

require 'minitest/autorun'
require_relative '../lib/nmax.rb'

class TestNmax < Minitest::Test
  def test_io_without_numbers
    io = StringIO.new
    io.puts 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...'
    io.rewind
    $stdin = io
    ARGV.replace ['1']
    out, _err = capture_io do
      Nmax.run
    end
    assert_equal("\n", out)
  end

  def test_io_with_one_number
    io = StringIO.new
    io.puts 'one1one'
    io.rewind
    $stdin = io
    ARGV.replace ['1']
    out, _err = capture_io do
      Nmax.run
    end
    assert_equal("1\n", out)
  end
end

require 'coveralls'
Coveralls.wear!

require 'minitest/autorun'
require_relative '../lib/nmax.rb'

module TestNmaxHelper
  def start(strings, argv)
    unless strings.empty?
      io = StringIO.new
      strings&.each { |str| io.puts str}
      io.rewind
      $stdin = io
    else
      $stdin = File.new('/dev/tty')
    end
    ARGV.replace argv
    @out, @err = capture_io do
      Nmax.run
    end
  end
end

class TestNmax < Minitest::Test
  include TestNmaxHelper
  attr_reader :out, :err
  def setup
    @strings = ['Lorem ipsum dolor sit amet, consectetur adipiscing elit...']
    @argv = ['1']
    @error_out = "Nmax must receive one argument (number). Example: nmax 100\n"
  end

  def test_without_numbers
    start(@strings, @argv)
    assert_equal('', out)
  end

  def test_with_one_number
    strings = ['one1one']
    start(strings, @argv)
    assert_equal("1\n", out)
  end

  def test_largest_numbers
    strings = ['L 1 ipsum 4 consectetur..1000',
               'Lorem 2 3000dolor am 3',
               'tetur 5 2000 elit']
    argv = ['3']
    start(strings, argv)
    assert_equal("3000\n2000\n1000\n", out)
  end

  def test_the_same_big_numbers
    strings = ['L 3000 ipsum 4 consectetur..1000',
               'Lorem 2 3000dolor am 3',
               'tetur2000 5 2000 elit']
    argv = ['3']
    start(strings, argv)
    assert_equal("3000\n2000\n1000\n", out)
  end

  def test_arguments_empty
    argv = []
    start(@strings, argv)
    assert_equal(@error_out, err)
  end

  def test_argument_not_number
    argv = ['arg1']
    start(@strings, argv)
    assert_equal(@error_out, err)
  end

  def test_many_arguments
    argv = ['100', 'arg']
    start(@strings, argv)
    assert_equal(@error_out, err)
  end

  def test_stdin
    start([], @argv)
    assert_equal("Not reading from stdin\n", err)
  end
end

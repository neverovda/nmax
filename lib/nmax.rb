module Nmax
  class << self
    def run
      warning
      return if wrong_args?
      return if not_presence_stdin?

      @size = ARGV[0].to_i
      @numbers = []
      strings_processing

      puts numbers
    end

    private

    attr_reader :size
    attr_accessor :numbers

    def warning
      warn 'Not reading from stdin' if not_presence_stdin?
      warn 'Nmax must receive one argument (number). Example: nmax 100' if wrong_args?
    end

    def not_presence_stdin?
      $stdin.tty?
    end

    def wrong_args?
      ARGV.size != 1 || argument_not_number?
    end

    def argument_not_number?
      !ARGV[0].match?(/^\d+$/)
    end

    def strings_processing
      $stdin.each { |line| add_nums search_numbers(line) }
    end

    def search_numbers(line)
      line.scan(/\d+/).map(&:to_i)
    end

    def add_nums(nums)
      return if nums.empty?

      nums.each { |n| add_number(n) }
    end

    def add_number(num)
      return if numbers.include?(num)

      insert_at = numbers.bsearch_index { |n| num > n }
      numbers.insert(insert_at, num) if insert_at
      numbers << num unless insert_at
      fix_overflow
    end

    def fix_overflow
      numbers.pop if numbers.size > size
    end
  end
end

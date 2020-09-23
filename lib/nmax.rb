module Nmax
  class << self
    def run
      parameter_check
      return if wrong_args?
      return if not_presence_stdin?

      @size = ARGV[0].to_i
      @numbers = []

      $stdin.each do |line|
        add_nums_to_result nums(line)
      end
      print '' if @numbers.empty?
      puts @numbers
    end

    private

    def parameter_check
      warn 'Not reading from stdin' if not_presence_stdin?
      warn 'Nmax must receive one argument (number). Example: nmax 100' if wrong_args?
    end

    def not_presence_stdin?
      $stdin.tty?
    end

    def wrong_args?
      ARGV.size != 1 || first_arg_not_number?
    end

    def first_arg_not_number?
      !ARGV[0].match?(/^\d+$/)
    end

    def nums(line)
      line.scan(/\d+/).map(&:to_i)
    end

    def add_nums_to_result(nums)
      return if nums.empty?

      nums.each { |n| add(n) }
    end

    def add(num)
      return if @numbers.include?(num)

      insert_at = @numbers.bsearch_index { |n| num > n }
      @numbers.insert(insert_at, num) if insert_at
      @numbers << num unless insert_at
      shorten
    end

    def shorten
      @numbers.pop if @numbers.size > @size
    end
  end
end

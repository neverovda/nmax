module Nmax
  class << self
    def run
      @size = ARGV[0].to_i
      @numbers = []

      $stdin.each do |line|
        add_nums_to_result nums(line)
      end
      puts '' if @numbers.empty?
      puts @numbers
    end

    private

    def nums(line)
      line.scan(/\d+/).map(&:to_i)
    end

    def add_nums_to_result(nums)
      return if nums.empty?

      nums.each { |n| add(n) }
    end

    def add(num)
      insert_at = @numbers.bsearch_index { |n| num >= n }
      @numbers.insert(insert_at, num) if insert_at
      @numbers << num unless insert_at
      shorten
    end

    def shorten
      @numbers.pop if @numbers.size > @size
    end
  end
end

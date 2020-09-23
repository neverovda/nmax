Gem::Specification.new do |s|
  s.name        = 'nmax_cli'
  s.version     = '0.0.0'
  s.executables << 'nmax'
  s.date        = '2020-09-22'
  s.summary     = 'Nmax - Simple gem for search bigest integers from input stream'
  s.description = 'Reads text data from the input stream; On completion of input,'\
                  ' prints the N largest integers encountered in the received text data.'\
                  'Example: cat sample_data_40GB.txt | nmax 10000'
  s.authors     = ['Dmitrii Neverov']
  s.email       = 'dmi.neverov@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'https://github.com/neverovda/nmax'
  s.license     = 'MIT'
end

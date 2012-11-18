lib = File.expand_path("../lib", __FILE__)
$:.unshift lib unless $:.include? lib

require "gas_stats/version"

Gem::Specification.new do |s|
  s.name = "gas_stats"
  s.version = GasStats::VERSION
  s.authors = "Fredrik Wallgren"
  s.email = "fredrik.wallgren@gmail.com"
  s.homepage = "https://github.com/walle/gas_stats"
  s.summary = "Keep track of your gas usage"
  s.description = "Keep track of your gas usage. Stores statistics for built in commands in gas"

  s.rubyforge_project = s.name

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE]

  s.add_dependency 'gas', '~> 1.0.0'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler'

  s.files = Dir.glob("{bin,lib}/**/*") + ['LICENSE', 'README.md']
  s.executables = Dir.glob("bin/*").map { |file| file.split('/').last }
  s.require_path = ['lib']
end


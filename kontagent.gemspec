# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "kontagent/version"

Gem::Specification.new do |s|
  s.name        = "kontagent"
  s.version     = Kontagent::VERSION
  s.authors     = ["luki3k5(Lukasz Lazewski)"]
  s.email       = ["luki3k5@gmail.com"]
  s.homepage    = "http://github.com/luki3k5/kontagent-lib"
  s.summary     = %q{This is the standalone library for accessing Kontagent REST API}
  s.description = %q{This is the standalone library for accessing Kontagent REST API, it is completely independent from any framework}

  s.rubyforge_project = "kontagent"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "titleize"
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Grant Hollingworth"]
  s.date = "2011-04-15"
  s.description = "Adds String#titleize for creating properly capitalized titles. Replaces ActiveSupport::Inflector.titleize if ActiveSupport is present."
  s.email = ["grant@antiflux.org"]
  s.homepage = "http://rubygems.org/gems/titleize"
  s.require_paths = ["lib"]
  s.rubyforge_project = "titleize"
  s.rubygems_version = "1.8.23"
  s.summary = "Adds String#titleize for creating properly capitalized titles."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end

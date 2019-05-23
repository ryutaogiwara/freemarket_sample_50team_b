# -*- encoding: utf-8 -*-
# stub: payjp 0.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "payjp"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["PAY.JP"]
  s.date = "2017-10-25"
  s.description = "PAY.JP makes it way easier and less expensive to accept payments."
  s.email = ["support@pay.jp"]
  s.homepage = "https://pay.jp"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Ruby bindings for the Payjp API"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>, ["~> 2.0"])
      s.add_development_dependency(%q<mocha>, ["~> 1.2.1"])
      s.add_development_dependency(%q<activesupport>, ["< 5.0", "~> 4.2.7"])
      s.add_development_dependency(%q<test-unit>, ["~> 3.2.2"])
      s.add_development_dependency(%q<rake>, ["~> 11.3.0"])
      s.add_development_dependency(%q<bundler>, [">= 1.7.6"])
    else
      s.add_dependency(%q<rest-client>, ["~> 2.0"])
      s.add_dependency(%q<mocha>, ["~> 1.2.1"])
      s.add_dependency(%q<activesupport>, ["< 5.0", "~> 4.2.7"])
      s.add_dependency(%q<test-unit>, ["~> 3.2.2"])
      s.add_dependency(%q<rake>, ["~> 11.3.0"])
      s.add_dependency(%q<bundler>, [">= 1.7.6"])
    end
  else
    s.add_dependency(%q<rest-client>, ["~> 2.0"])
    s.add_dependency(%q<mocha>, ["~> 1.2.1"])
    s.add_dependency(%q<activesupport>, ["< 5.0", "~> 4.2.7"])
    s.add_dependency(%q<test-unit>, ["~> 3.2.2"])
    s.add_dependency(%q<rake>, ["~> 11.3.0"])
    s.add_dependency(%q<bundler>, [">= 1.7.6"])
  end
end

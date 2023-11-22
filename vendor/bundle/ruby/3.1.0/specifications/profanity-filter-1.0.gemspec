# -*- encoding: utf-8 -*-
# stub: profanity-filter 1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "profanity-filter".freeze
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/cardinalblue/profanity-filter/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/cardinalblue/profanity-filter", "source_code_uri" => "https://github.com/cardinalblue/profanity-filter" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Maso Lin".freeze, "Jenny Shih".freeze, "YenTing Chen".freeze]
  s.bindir = "exe".freeze
  s.date = "2019-12-31"
  s.description = "Detects profane words using multiple strategies,\n                        including similarities, diacritics(sound alterations),\n                        constructions (multi-part), injections and unicode.".freeze
  s.email = ["dev@cardinalblue.com".freeze]
  s.homepage = "https://github.com/cardinalblue/profanity-filter".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.26".freeze
  s.summary = "To detect if a given string contains profane words.".freeze

  s.installed_by_version = "3.3.26" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<webpurify>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<pry>.freeze, ["~> 0.12.2"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_development_dependency(%q<rr>.freeze, [">= 0"])
  else
    s.add_dependency(%q<webpurify>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.12.2"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<rr>.freeze, [">= 0"])
  end
end

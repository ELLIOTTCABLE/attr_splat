# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{attr_splat}
  s.version = "0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["elliottcable"]
  s.date = %q{2008-10-13}
  s.description = %q{attr_* puts Ruby Core's attr_accessor, attr_reader, and attr_reader on steroids}
  s.email = ["attr_splat@elliottcable.com"]
  s.extra_rdoc_files = ["lib/attr_splat.rb", "README.markdown"]
  s.files = ["lib/attr_splat.rb", "Rakefile.rb", "README.markdown", "spec/attr_splat_spec.rb", "spec/spec_helper.rb", ".manifest", "attr_splat.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://by.elliottcable.name/attr_splat.xhtml}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Attr_splat", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{attr_*}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{attr_* puts Ruby Core's attr_accessor, attr_reader, and attr_reader on steroids}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0", "= 3.0.2"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<stringray>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0", "= 3.0.2"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<stringray>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0", "= 3.0.2"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<stringray>, [">= 0"])
  end
end

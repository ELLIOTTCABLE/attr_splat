attr_*
======
*`attr_*`* is a library to extend the basic Ruby class/module attribute
functions with some useful functionality. It supports the original attribute
API, as well as additional features such as defaults values for attributes and
attribute initialization.

Specifically, three types of attribute initialization are supported:

- none (as per the functionality of the original attr_accessor et al., the
    instance variables won’t be initialized to any value — `instance_variable_defined?(:@ivar)`
    will return false)
- first-access initialization (the attribute will be undefined until first
    accessed)
- instance initialization (the attribute will be defined with the instance,
    thus being defined for all parts of the lifecycle of the instance, for all
    intents and purposes)

Usage
-----
`attr_*` exposes a single method, `Module#attr_splat`, that takes a series of
Symbols from which to create attributes, along with an options hash at the end.

However, most users will want to replace the existing `attr_*` functionality
with this (the API is fully backwards compatible; as long as none of your code
depends on the particular inner workings of the existing `attr_*` methods, it
should continue to work fine as-is). This isn't difficult, and for the most
part amounts to the following:
    
    class Module
       def attr_accessor *args
        attr_splat(*args)
      end

      def attr_reader *args
        opts = args.last.is_a?(Hash) ? args.pop : Hash.new
        args << {:writer => false}.merge(opts)
        attr_splat(*args)
      end

      def attr_writer *args
        opts = args.last.is_a?(Hash) ? args.pop : Hash.new
        args << {:writer => false}.merge(opts)
        attr_splat(*args)
      end
    end

If you're lazy, you can shorten the above to something like this:
    
    Module::attr_splat!
    
Using `attr_*` is pretty simple - just use the `attr_*` methods as you
normally would. If you need to supply a default value for an attribute, you
can add a `:default` parameter as follows:
    
    class Something
      attr_accessor :something, :default => "summat"
    end
    
You can define more than one attribute with the same default at the same time:
    
    attr_accessor :something, :something_else, :default => "summat"
    
Attributes with a default flag will (by default) to the second initialization
method described above - that is, the default value will be initialized into
the attribute's variable only after the first time the attribute's getter is
called. If you want default values to be initialized along with the instance
of the class, you can pass the `:initialize` flag - it's disabled by default,
because it relies on some metaprogrammy magic that this author prefers to
avoid calling into every class all over Ruby's source.
    
    attr_accessor :something, :something_else,
      :default => "summat", :initialze => true
    
If you call the initialize flag without a default, the attribute is
initialized to `nil`.
    
    attr_accessor :something, :something_else, :initialze => true
    
Installation
------------
You can install `attr_*` as a pre-built gem, or as a gem generated directly
from the source.

The easiest way to install `attr_*` is to use [RubyGems][] to acquire the
latest 'release' version from [RubyForge][], using the `gem` command line tool:

    sudo gem install attr_splat # You'll be asked for your account password.

Alternatively, you can acquire it (possibly slightly more up-to-date,
depending on how often I update the gemspec) from GitHub as follows:

    # If you've ever done this before, you don't need to do it now - see http://gems.github.com
    gem sources -a http://gems.github.com
    sudo gem install elliottcable-attr_splat # You'll be asked for your account password.
    
Finally, you can build a gem from the latest source yourself. You need [git][],
as well as [Rake][] and [echoe][]:

    git clone git://github.com/elliottcable/attr_splat.git
    cd attr_splat
    rake package:install # You'll be asked for your account password.

[RubyGems]: <http://rubyforge.org/projects/rubygems/> "RubyGems - Ruby package manager"
[RubyForge]: <http://rubyforge.org/projects/attr_splat/> "attr_* on RubyForge"
[git]: <http://git-scm.com/> "git - Fast Version Control System"
[Rake]: <http://rake.rubyforge.org/> "RAKE - Ruby Make"
[echoe]: <http://github.com/fauna/echoe> "If you don't want to hoe, echoe"

Contributing
------------
You can contribute bug fixes or new features to `attr_*` by forking the project
on GitHub (you'll need to register for an account first), and sending me a
pull request once you've committed your changes.

Links
-----
- [GitHub](http://github.com/elliottcable/attr_splat "attr_* on GitHub") is the
    project's primary repository host, and currently also the project's home
    page
- [RubyForge](http://rubyforge.org/projects/attr_splat "attr_* on RubyForge") is
    out primary RubyGem host, as well as an alternative repository host
- [integrity](http://integrit.yreality.net/attr_splat "attr_* on yreality's integrity server")
    is out continuous integration server - if the top build on that page is
    green, you can assume the latest git HEAD is safe to run/install/utilize.
- [Gitorious](http://gitorious.org/projects/attr_splat "attr_* on Gitorious") is
    an alternative repository host
- [repo.or.cz](http://repo.or.cz/w/attr_splat.git "attr_* on repo.or.cz") is
    an alternative repository host

License
-------
`attr_*` is copyright 2008 by elliott cable.

`attr_*` is released under the [GNU General Public License v3.0][gpl], which
allows you to freely utilize, modify, and distribute all `attr_*`'s source code
(subject to the terms of the aforementioned license).

[gpl]: <http://www.gnu.org/licenses/gpl.txt> "The GNU General Public License v3.0"
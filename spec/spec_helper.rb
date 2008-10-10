($:.unshift File.expand_path(File.join( File.dirname(__FILE__), '..', 'lib' ))).uniq!
require 'attr_splat'

# Require spec here, for things like autotest and rdebug that aren't running
# using the Rakefile.
require 'spec'
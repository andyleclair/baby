$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'baby'
require 'test/unit'
Dir['test/unit/*.rb'].each {|file| load file }

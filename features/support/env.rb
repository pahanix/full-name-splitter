require File.expand_path(File.dirname(__FILE__) + '/../../spec/spec_helper.rb')

class Incognito
  include FullNameSplitter
  attr_accessor :first_name, :last_name
end

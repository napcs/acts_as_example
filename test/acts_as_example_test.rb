# load in the test helper
require File.join(File.dirname(__FILE__), 'test_helper')


# Create our Widget class and load up our plugin
class Widget < ActiveRecord::Base
  acts_as_example
end



class ActsAsExampleTest < Test::Unit::TestCase
  
  def test_should_respond_to_the_class_method_latest_five
    assert Widget.respond_to? "latest_five"
  end
  
  def test_should_get_latest_five_entries
    
    %W{one two three four five six seven eight}.each do |w|
      Widget.create :name => w
    end
    
    assert_equal 5, Widget.latest_five.length
    
  end
  
  def test_should_respond_to_the_method_to_example
    assert Widget.new.respond_to? "to_example"
  end
  
end

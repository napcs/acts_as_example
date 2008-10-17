# ActsAsExample
module Acts
  module Example
    
    def self.included(base)
      base.extend Acts::Example::ClassMethods
    end
    
    # this module should contain your code that you want mixed in to the class.
    # it's also a good place to put a macro that invokes your plugin.
    module ClassMethods
      
      # Adds class and instance methods to the model to demonstrate how an ActiveRecord plugin should work
      #
      #  class User < ActiveRecord::Base
      #     acts_as_example
      #  end
      #
      # This will generate the following instance methods
      #  * to_example  : 
      # This also generates the following class methods
      #  * latest_five
      def acts_as_example
        class_eval <<-END
          include Acts::Example::InstanceMethods
        END
      end
      
      # returns the latest five entries
      def latest_five
         self.find :all, :limit=>5, :order => "created_at desc"
      end
      
    end
    
    
    module InstanceMethods
      
      # replace this with your own implementation
      def to_example
        "Some example output"
      end
      
    end
    
    
    
  end
end

class Class
  
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    #attr_reader attr_name # create the attribute's getter
    #attr_reader attr_name+"_history" # create bar_history getter
    
    attr_accessor attr_name # create the attribute's setter
    attr_accessor attr_name+"_history" # create bar_history setter
    
    class_eval %Q{
      def #{attr_name}=(val)
       
			if(!defined?(@#{attr_name}_history))
				@#{attr_name}_history = [@#{attr_name}]
			end

			@#{attr_name} = val
			@#{attr_name}_history << val
      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
end

f = Foo.new # => #<Foo:0x127e678>
f.bar = 3 # => 3
f.bar = :wowzo # => :wowzo
f.bar = 'boo!' # => 'boo!'
puts f.bar_history # => [nil, 3, :wowzo, 'boo!']

f = Foo.new
f.bar = 1
f.bar = 2
puts f.bar_history # => if your code works, should be [nil,1,2]





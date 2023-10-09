module Accessors 
  def attr_accessor_with_history(*args)

    args.each do |arg|
      var_name = "@#{arg}".to_sym
      define_method(arg) { instance_variable_get(var_name) }

      define_method("#{arg}=") do |value|
        
        if instance_variable_get("@#{arg}_old")
          instance_variable_set("@#{arg}_old", instance_variable_get("@#{arg}_old") << value)
          instance_variable_set(var_name, value)
        else
          instance_variable_set(var_name, value)
          instance_variable_set("@#{arg}_old", [value])
        end
      end
        define_method("#{arg}_history") { instance_variable_get("@#{arg}_old") }
    end
  end
end

class Foo
  
  extend Accessors
  
  attr_accessor_with_history :a, :b
end




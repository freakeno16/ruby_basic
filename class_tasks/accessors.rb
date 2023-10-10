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

  def strong_attr_accessor(attr_name, attr_class)
    var_name = "@#{attr_name}".to_sym

    define_method(name) { instance_variable_get(var_name) }
    define_method("#{attr_name}=") do |value| 
      if value.is_a? attr_class
        instance_variable_set(var_name, value)
      else
        raise "Wrong attr_class, must be #{attr_class}, retry please"
      end
    end
  end
end

 

class Foo
  
  extend Accessors
  
  # attr_accessor_with_history :a, :b
  # strong_attr_accessor :a, :Integer
end


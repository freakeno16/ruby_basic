module Validation

  def validate(attr_name, val_type, *args)
    var_name = "@#{attr_name}".to_sym

    define_method(attr_name) { instance_variable_get(var_name) } 
    define_method("#{attr_name}=") do |value|
      if val_type == :presence
        yield if block_given?
        raise "huy tebe eblan" if value == '' || value == nil
        instance_variable_set(var_name, value)
      elsif val_type == :format
        yield if block_given?
        raise "huy tebe loshara" if value !~ /A-Z{0,3}/
        instance_variable_set(var_name, value)
      elsif val_type == :type
        yield if block_given?
        raise "huy tebe bomjara" if value != self.class
        instance_variable_set(var_name, value)
      end
    end
  end
end
 
class Foo
  
  extend Validation
  
  validate :name, :type, Foo
end
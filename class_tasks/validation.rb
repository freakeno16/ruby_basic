module Validation
  def validate(attr_name, val_type, *args)
    args.each do |arg|
      var_name = "@#{attr_name}".to_sym

      define_method(attr_name) { instance_variable_get(var_name) } 

      define_method("#{attr_name}=") do |value|
        case val_type
        when :presence
          raise "Value can't be empty string or nil!" if value == '' || value == nil
          instance_variable_set(var_name, value)
        when :format
          raise "Value must be match the regexp!" if value !~ arg #/A-Z{0,3}/
          instance_variable_set(var_name, value)
        when :type
          raise "Value must be match the class!" if value != arg #self.class
          instance_variable_set(var_name, value)
        end
      end
    end
  end
end

class Foo
  
  extend Validation
  
  validate :name, :presence
end
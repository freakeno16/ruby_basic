module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(name, type, *args)
      var_name = "@#{name}".to_sym

      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=") do |value|
        if type == :presence
          raise "Value can't be empty string or nil!" if ['', nil].include?(value)

          instance_variable_set(var_name, value)
        end

        args.each do |arg|
          case type
          when :format
            raise 'Value must be match the regexp!' if value !~ arg

            instance_variable_set(var_name, value)
          when :type
            raise 'Value must be match the class!' unless value.is_a?(arg)

            instance_variable_set(var_name, value)
          end
        end
      end
    end
  end

  module InstanceMethods
    def validate!
    end
  end
end





class Class
  def attr_accessor_with_history (attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name+"_history"
    class_eval %Q{
      def #{attr_name}=(new_value)
        @#{attr_name}_history ||= [nil]
        @#{attr_name}_history << new_value
        @#{attr_name} = new_value
      end
    }
  end
end
# The or-equals ( ||= ) was key to me getting this problem. Honestly, I had to look this up.
# I understood all the logic; I was just unsure about the syntax.
class Foo
  attr_accessor_with_history :bar
end

class String
  def palindrome? 
  end
end

module Enumerable
  def palindrome?
    copy = self.inject(""){  |result, item|  result += item.to_s()}
    copy.downcase.gsub(/\W/, "") == copy.downcase.gsub(/\W/, "").reverse
  end
end

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id, *args)
    method_name = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(method_name)
      self * @@currencies[method_name]
    elsif method_name == "in"
      arg_name = args[0].to_s.gsub( /s$/, '')
      self * @@currencies[arg_name] if @@currencies.has_key?(arg_name)
    else
      super
    end
  end
end

# # 
# a = Array.new
# a[0] = nil
# a[1] = 10
# a[2] = 100
# print a
# 
#   

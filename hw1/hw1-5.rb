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
f = Foo.new
f.bar=1
f.bar = 1
f.bar = 2
print f.bar_history.inspect
# # 
# a = Array.new
# a[0] = nil
# a[1] = 10
# a[2] = 100
# print a
# 
#   

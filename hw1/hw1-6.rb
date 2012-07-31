class CartesianProduct
  include Enumerable

  def initialize (a, b)
    @a, @b = a, b
  end

  def each
    @a.each{ |x| @b.each { |y| yield [x,y] } }
  end
end
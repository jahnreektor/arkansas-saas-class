class Dessert
  def initialize(name, calories)
    @name,@calories = name, calories
  end
  def calories
    @calories
  end
  def healthy?
    calories<200
  end
  def delicious?
    true
  end 
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name,calories)
    @flavor = flavor
  end

  def flavor
    @flavor
  end

  def flavor=(flavor)
    @flavor=flavor
  end

  def delicious?
    flavor!='black licorice'
  end
end
# Test code
# a = Dessert.new("yum", 100)
# p a.healthy?
# a = JellyBean.new("yum", 100, "black licorice")
# p a.delicious?
class Dessert
  def initialize(name, calories)
    
    @name = name
    @calories = calories
    
  end
  
  def name
    return @name
  end
  
  def name= (name)
    @name = name
  end
  
  def calories
    return @calories
  end
  
  def calories=(calories)
    @calories = calories
  end

  
  def healthy?
    if @calories <= 200 then return true end
  end
  
  def delicious?
    deserts = ["cake", "ice cream", "pudding", "cupcake", "pie", "beer", "apple" ]
    deserts.include? @name
  end
  
end

class JellyBean < Dessert
  def initialize(flavor)
    @name = flavor <<" jelly bean"
    @calories = 5
  end
  
  def delicious?
    @name.downcase  != "licorice jelly bean" 
  end
  
end

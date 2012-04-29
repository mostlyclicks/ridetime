class Rider < ActiveRecord::Base
  def rider_time
    #finish_time - start_time
    rider_time = self.distance_between(start_time, finish_time)
  end
  
  def distance_between(start_time, finish_time)
    difference    = 0
    difference    = finish_time.to_i - start_time.to_i
    seconds       = difference % 60
    difference    = (difference - seconds) / 60
    minutes       = difference % 60
    

      
    
    return "#{minutes}:#{seconds}"
  end
  
  
  def to_time()
    self
  end

end

#require 'chronic'
require 'chronic_duration'

class Rider < ActiveRecord::Base
  
  #attr_accessible :start_time, :finish_time
  
  def rider_time
    #finish_time - start_time
    #rider_time = self.distance_between(start_time, finish_time)
    c = (finish_time - start_time).round
    ChronicDuration.output(c, :format => :short)
  end
  
  def distance_between(start_time, finish_time)
    difference    = 0
    difference    = finish_time.to_i - start_time.to_i
    seconds       = difference % 60
    difference    = (difference - seconds) / 60
    minutes       = difference % 60
    
    return "#{minutes}:#{seconds}"
  end
  
  #def clear_time
  #  self.finish_time = ChronicDuration.output(0)
  #end

end

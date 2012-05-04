#require 'chronic'
require 'chronic_duration'

class Rider < ActiveRecord::Base
  
  #after_create :push_create
  #after_update :push_update
  
  after_update :push_cleartime
  after_update :push_finish
  after_update :push_start
  
  def rider_time
    'Hello'
    #c = (finish_time - start_time).round
  end
  
  protected
  
  def push_cleartime
    #self.start_time = 0
    #self.finish_time = 0
    push_event('cleartime')
  end
  
  def push_finish
    #rider_time = (self.finish_time - self.start_time).round
    #self.rider_time = 'hello'
    push_event('rider_finish')
    #rider_time
  end
  
  def push_start
    #self.start_time
    push_event('rider_start')
  end
  
  def push_create
    push_event('create')
  end
  
  def push_update
    push_event('update')
  end
  
  def z
    23
  end
  
  def push_event(event_type)
    
    Pusher["ridetime-#{Rails.env}"].trigger(event_type,
                                    {:id => self.id.to_s, #do I need this?
                                    :name => self.name,
                                    :race_number => self.race_number,
                                    :start_time => self.start_time,
                                    :finish_time => self.finish_time
                                    #:rider_time => self.rider_time#,
                                    })
  end
  

  

end

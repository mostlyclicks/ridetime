#require 'chronic'
require 'chronic_duration'

class Rider < ActiveRecord::Base
  
  after_create :push_create
  after_update :push_update
  
  def rider_time
    c = (finish_time - start_time).round
  end
  
  protected
  
  def push_create
    push_event('create')
  end
  
  def push_update
    push_event('update')
  end
  
  def push_event(event_type)
    Pusher["ridertime-#{Rails.env}"].trigger(event_type,
                                    {:id => self.id.to_s, #do I need this?
                                    :name => self.name,
                                    :race_number => self.race_number,
                                    :start_time => self.start_time,
                                    :finish_time => self.finith_time,
                                    :rider_time => self.rider_time})
  end
  


end

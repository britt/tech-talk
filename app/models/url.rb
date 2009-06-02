class Url < ActiveRecord::Base
  validates_presence_of :location
  # YOu probably want to use a real regex here
  validates_format_of :location, :with => /^http[s]?:\/\//, :message => 'Location must be a valid Url.', :if => :location
end

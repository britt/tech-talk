class Url < ActiveRecord::Base
  validates_presence_of :location
  # You probably want to use a real regex here
  validates_format_of :location, :with => /^http[s]?:\/\//, :message => 'Location must be a valid Url.', :unless => lambda { |url| url.location.blank? }

  after_create :generate_slug
 
  private

  def generate_slug
    update_attribute(:slug, id.to_s(36))
  end
end

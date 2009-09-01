class AlumniProfile < ActiveRecord::Base
  has_one :content, :as => :contentable, :dependent => :destroy
  
  validates_presence_of :name
  
  accepts_nested_attributes_for :content
  
  attr_accessor :contentable_class
  
  def self.display_name
    "Alumni Profile"
  end
end

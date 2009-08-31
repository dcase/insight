class AlumniProfile < ActiveRecord::Base
  has_one :content, :as => :contentable, :dependent => :destroy
  
  validates_presence_of :name, :isa_job, :current_job, :education, :questions, :quotation
  
  accepts_nested_attributes_for :content
  
  attr_accessor :contentable_class
  
  def self.display_name
    "Alumni Profile"
  end
end

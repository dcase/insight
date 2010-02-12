class Page < ActiveRecord::Base
  belongs_to :section
  has_many :blocks, :dependent => :destroy, :order => :position
  belongs_to :seo_profile
  
  acts_as_list :scope => :section
  
  validates_presence_of :short_name
  
  def to_param
    "#{id}-#{short_name.downcase.strip.gsub(/\ /, '-').gsub(/[^\w\-]/, '').gsub(/[-]+/, '-')}"
  end
  
  def before_save
    if self.long_name.blank?
      self.long_name = self.short_name
    end
  end
end

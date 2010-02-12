class Post < ActiveRecord::Base
  belongs_to :blog
  
  validates_presence_of :title, :published_on, :body
  
  def to_param
    "#{id}-#{title.downcase.strip.gsub(/\ /, '-').gsub(/[^\w\-]/, '').gsub(/[-]+/, '-')}"
  end
end

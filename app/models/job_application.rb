class JobApplication < ActiveRecord::Base
  has_attached_file :resume
  has_attached_file :letter
  
  validates_presence_of :first_name, :last_name, :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "must be a valid email address."
  validates_attachment_presence :resume
  validates_attachment_content_type :resume, :content_type => ["application/msword","application/pdf"], :message => "needs to be a Word doc (.doc) or PDF (.pdf)"
  validates_attachment_content_type :letter, :content_type => ["application/msword","application/pdf"], :message => "needs to be a Word doc (.doc) or PDF (.pdf)"
end

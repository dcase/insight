class JobApplicationMailer < ActionMailer::Base
  

  def submit(job_application)
    subject    'new online application from website'
    recipients 'case_darren@yahoo.com'
    from       'apply_online@insightstrat.com'
    sent_on    Time.now
    
    body       :job_application => job_application
    attachment :content_type => job_application.resume_content_type, 
    :body => File.read(File.join(job_application.resume.path)), 
    :filename => File.basename(job_application.resume.url)
    
    unless job_application.letter_file_name.blank?
      attachment :content_type => job_application.letter_content_type, 
      :body => File.read(File.join(job_application.letter.path)), 
      :filename => File.basename(job_application.letter.url)
    end
  end

end

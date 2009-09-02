require 'test_helper'

class JobApplicationMailerTest < ActionMailer::TestCase
  test "submit" do
    @expected.subject = 'JobApplicationMailer#submit'
    @expected.body    = read_fixture('submit')
    @expected.date    = Time.now

    assert_equal @expected.encoded, JobApplicationMailer.create_submit(@expected.date).encoded
  end

end

class CreateJobApplications < ActiveRecord::Migration
  def self.up
    create_table :job_applications do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :position
      t.string :resume_file_name
      t.string :resume_content_type
      t.integer :resume_file_size
      t.datetime :resume_updated_at
      t.string :letter_file_name
      t.string :letter_content_type
      t.integer :letter_file_size
      t.datetime :letter_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :job_applications
  end
end

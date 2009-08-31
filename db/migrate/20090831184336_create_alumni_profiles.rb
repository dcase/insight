class CreateAlumniProfiles < ActiveRecord::Migration
  def self.up
    create_table :alumni_profiles do |t|
      t.string :name
      t.string :isa_job
      t.string :current_job
      t.string :education
      t.text :questions
      t.text :quotation

      t.timestamps
    end
  end

  def self.down
    drop_table :alumni_profiles
  end
end

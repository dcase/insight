class AddPublishedToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :published, :boolean, :default => 0
  end

  def self.down
    remove_column :posts, :published
  end
end

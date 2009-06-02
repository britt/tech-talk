class AddIndexToSlug < ActiveRecord::Migration
  def self.up
    add_index :urls, :slug
  end

  def self.down
    remove_index :urls, :slug
  end
end

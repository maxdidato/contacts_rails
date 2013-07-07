class AddPhoto < ActiveRecord::Migration
  def self.up
    add_attachment :contacts, :photo
  end

  def self.down
    remove_attachment :contact, :photo
  end
end
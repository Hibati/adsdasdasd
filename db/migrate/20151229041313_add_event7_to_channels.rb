class AddEvent7ToChannels < ActiveRecord::Migration
  def self.up
    add_column :channels, :Event_7, :string #時
    add_column :channels, :Event_8, :string #分
    add_column :channels, :Then_do_these_things_5st, :string
    add_column :channels, :Event_9, :string
    add_column :channels, :Then_do_these_things_6st, :string
    add_column :channels, :Event_10, :string
    
  end
  
  def self.down
    remove_column :channels, :Event_7, :string
    remove_column :channels, :Event_8, :string
    remove_column :channels, :Then_do_these_things_5st, :string
    remove_column :channels, :Event_9, :string
    remove_column :channels, :Then_do_these_things_6st, :string
    remove_column :channels, :Event_10, :string
    
  end
end

class AddLogicsToChannels < ActiveRecord::Migration
  def self.up
    add_column :channels, :When_this_stuff_happens, :string
    add_column :channels, :Event_1, :string
    add_column :channels, :Event_2, :string
    add_column :channels, :Then_do_these_things_1st, :string
    add_column :channels, :Event_3, :string
    add_column :channels, :Then_do_these_things_2st, :string
    add_column :channels, :Event_4, :string
    add_column :channels, :Then_do_these_things_3st, :string
    add_column :channels, :Event_5, :string
    add_column :channels, :Then_do_these_things_4st, :string
    add_column :channels, :Event_6, :string
    add_column :channels, :action_status, :string
    add_column :channels, :jid_id, :string
    
  end
  
  def self.down
    remove_column :channels, :When_this_stuff_happens
    remove_column :channels, :Event_1
    remove_column :channels, :Event_2
    remove_column :channels, :Then_do_these_things_1st
    remove_column :channels, :Event_3
    remove_column :channels, :Then_do_these_things_2st
    remove_column :channels, :Event_4
    remove_column :channels, :Then_do_these_things_3st
    remove_column :channels, :Event_5
    remove_column :channels, :Then_do_these_things_4st
    remove_column :channels, :Event_6
    remove_column :channels, :action_status
    remove_column :channels, :jid_id
  end
end

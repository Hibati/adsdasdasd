class AddTwitterpostToChannels < ActiveRecord::Migration
  def self.up
    add_column :channels, :twitter_check, :string
    add_column :channels, :twitter_provider, :string
    add_column :channels, :twitter_uid, :string
    add_column :channels, :twitter_name, :string
    add_column :channels, :twitter_oauth_token, :string
    add_column :channels, :twitter_oauth_secret, :string
    
  end
  
  def self.down
    remove_column :channels, :twitter_check, :string
    remove_column :channels, :twitter_provider, :string
    remove_column :channels, :twitter_uid, :string
    remove_column :channels, :twitter_name, :string
    remove_column :channels, :twitter_oauth_token, :string
    remove_column :channels, :twitter_oauth_secret, :string
    
  end
end

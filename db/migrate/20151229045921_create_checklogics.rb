class CreateChecklogics < ActiveRecord::Migration
  def self.up
    create_table :checklogics do |t|
      t.string :channel_id_logics

      t.timestamps
    end
  end

  def self.down
    drop_table :checklogics
  end
end

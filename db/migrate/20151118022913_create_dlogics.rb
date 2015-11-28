class CreateDlogics < ActiveRecord::Migration
  def change
    create_table :dlogics do |t|
      t.string :When_this_stuff_happens
      t.string :Event_1
      t.string :Event_2
      t.string :Then_do_these_things_1st
      t.string :Event_3
      t.string :Then_do_these_things_2st
      t.string :Event_4
      t.string :Then_do_these_things_3st
      t.string :Event_5
      t.string :Then_do_these_things_4st
      t.string :Event_6

      t.timestamps
    end
  end
end

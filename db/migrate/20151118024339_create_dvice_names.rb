class CreateDviceNames < ActiveRecord::Migration
  def change
    create_table :dvice_names do |t|
      t.string :name
      t.references :actuator, index: true

      t.timestamps
    end
  end
end

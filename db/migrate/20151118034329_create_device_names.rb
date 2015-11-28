class CreateDeviceNames < ActiveRecord::Migration
  def change
    create_table :device_names do |t|
      t.string :name
      t.references :DeviceType, index: true

      t.timestamps
    end
  end
end

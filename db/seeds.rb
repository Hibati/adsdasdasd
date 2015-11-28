# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
DeviceType.create(name: "Sensor")
DeviceType.create(name: "Actuator")
  
DeviceName.create(name: "paris", DeviceType_id: DeviceType.find_by(name: "Sensor").id)
DeviceName.create(name: "nice", DeviceType_id: DeviceType.find_by(name: "Sensor").id)
DeviceName.create(name: "roma", DeviceType_id: DeviceType.find_by(name: "Actuator").id)
DeviceName.create(name: "venezia", DeviceType_id: DeviceType.find_by(name: "Actuator").id)
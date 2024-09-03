require 'spec_helper'

RSpec.describe 'VehicleFactory' do
    before(:each) do
      @factory = VehicleFactory.new
      @data = DmvDataService.new.wa_ev_registrations
    end
it 'can initialize VehicleFactory' do
    expect(@factory).to be_an_instance_of(VehicleFactory)
  end

  it 'Can create a vehicle based on the given parameters of vehicles in WA' do
    
    @factory.create_vehicles(@data)
    
    expected_first_entry = {
    :electric_vehicle_type => "Plug-in Hybrid Electric Vehicle",
    :vin =>  "JTDKN3DP8D",
    :dol_vehicle_id => "229686908",
    :model_year => "2013",
    :make => "TOYOTA",
    :model => "Prius Plug-in"
  }

  expected_last_entry = {
    :electric_vehicle_type => "Plug-in Hybrid Electric Vehicle",
    :vin_1_10 => "1G1RD6E47D",
    :dol_vehicle_id => "289314742",
    :model_year => "2013",
    :make => "CHEVROLET",
    :model => "Volt"
  }
  expect(@factory.create_vehicles(@data).count).to eq(@data.count)
  end
end
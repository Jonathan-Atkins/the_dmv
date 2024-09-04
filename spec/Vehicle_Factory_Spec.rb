require 'spec_helper'

RSpec.describe 'VehicleFactory' do
    before(:each) do
      @factory = VehicleFactory.new
      @data = DmvDataService.new.wa_ev_registrations
      @states_dmv = DmvFactoy.new
    end
it 'can initialize VehicleFactory' do
    expect(@factory).to be_an_instance_of(VehicleFactory)
  end

it 'Can create a vehicle based on the given parameters of vehicles in WA' do
    
  vehicles = @factory.create_vehicles(@data) 
    
  first_vehicle = vehicles.first
   #require 'pry' ; binding.pry 
    expect(first_vehicle.vin).to eq('5YJYGDED6M')
    expect(first_vehicle.year).to eq('2021')
    expect(first_vehicle.make).to eq('TESLA')
    expect(first_vehicle.model).to eq('Model Y')
    expect(first_vehicle.engine).to eq(:ev)
  end  
end

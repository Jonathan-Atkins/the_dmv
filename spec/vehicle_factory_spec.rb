require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        # require 'pry'; binding.pry
    end

    describe 'vehicle creation' do
        it 'maps vehicle data to new array' do
            vehicles = @factory.create_vehicles(@wa_ev_registrations)

            expect(vehicles).to all(be_a(Vehicle))
            expect(vehicles).to be_an(Array)
        end

        it 'maps the correct data to the new Vehicle object' do
            vehicles = @factory.create_vehicles(@wa_ev_registrations)

            expect(vehicles.first.make).to eq("TESLA")
            expect(vehicles.first.model).to eq("Model Y")
            expect(vehicles.first.plate_type).to eq(nil)
            expect(vehicles.first.registration_date).to eq(nil)
            expect(vehicles.first.vin).to eq("5YJYGDED6M")
            expect(vehicles.first.year).to eq("2021")
            expect(vehicles.first.engine).to eq(:ev)
        end
    end
end
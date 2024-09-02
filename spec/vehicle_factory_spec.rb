require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end

    describe 'vehicle creation' do
        it 'maps vehicle data to new array' do
            vehicles = @factory.create_vehicles(@wa_ev_registrations)

            expect(vehicles).to all(be_a(Vehicle))
            expect(vehicles).to be_an(Array)
        end

        it 'maps the correct data to the new Vehicle object' do
            vehicles = @factory.create_vehicles(@wa_ev_registrations)

            expect(vehicles.first.make).to eq(@wa_ev_registrations.first[:make])
            expect(vehicles.first.model).to eq(@wa_ev_registrations.first[:model])
            expect(vehicles.first.plate_type).to eq(@wa_ev_registrations.first[:plate_type])
            expect(vehicles.first.registration_date).to eq(@wa_ev_registrations.first[:registration_date])
            expect(vehicles.first.vin).to eq(@wa_ev_registrations.first[:vin_1_10])
            expect(vehicles.first.year).to eq(@wa_ev_registrations.first[:model_year])
            expect(vehicles.first.engine).to eq(:ev)
        end
    end
end
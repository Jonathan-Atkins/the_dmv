require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end

    describe 'vehicle creation' do
        it 'maps vehicle data to new array' do
        factory = VehicleFactory
        vehicles = factory.create_vehicles(@wa_ev_registrations)

        expect(vehicles).to all(include(:make, :model, :plate_type, :registration_date, :vin, :year))
        expect(vehicles).to be_an(Array)
        expect(vehicles.first).to be_a(Hash)
        end

        it 'includes correct attributes in vehicles array' do
        factory = VehicleFactory
        vehicles = factory.create_vehicles(@wa_ev_registrations)
        first_vehicle = vehicles.first

        expect(first_vehicle[:engine_type]).to eq(@wa_ev_registrations.first[:engine_type])
        expect(first_vehicle[:make]).to eq(@wa_ev_registrations.first[:make])
        expect(first_vehicle[:model]).to eq(@wa_ev_registrations.first[:model])
        expect(first_vehicle[:plate_type]).to eq(@wa_ev_registrations.first[:plate_type])
        expect(first_vehicle[:registration_date]).to eq(@wa_ev_registrations.first[:registration_date])
        expect(first_vehicle[:vin]).to eq(@wa_ev_registrations.first[:vin])
        expect(first_vehicle[:year]).to eq(@wa_ev_registrations.first[:year])
        end
    end
end
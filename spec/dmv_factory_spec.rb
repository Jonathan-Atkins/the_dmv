require 'spec_helper'

RSpec.describe DmvFactory do
    before(:each) do
        @dmv_factory = DmvFactory.new 
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    end

    it 'maps facility data to new array' do
        facilities = @dmv_factory.create_facilities(@co_dmv_office_locations)

        expect(facilities).to all(be_a(Facility))
        expect(facilities).to be_an(Array)
    end

    it 'maps the correct data to the new Facility object' do
        facilities = @dmv_factory.create_facilities(@co_dmv_office_locations)

        expect(facilities.first.name).to eq(@co_dmv_office_locations.first[:dmv_office])
        expect(facilities.first.address).to eq("2855 Tremont Place, Suite 118, Denver, CO, 80205")
        expect(facilities.first.phone).to eq(@co_dmv_office_locations.first[:phone])
        # expect(facilities.first.services).to eq("vehicle titles, registration, renewals;  VIN inspections")
        expect(facilities.first.registered_vehicles).to eq([])
        expect(facilities.first.collected_fees).to eq(0)
    end
end
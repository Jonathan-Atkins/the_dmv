require 'spec_helper'

RSpec.describe DmvFactory do
    before(:each) do
        @dmv_factory = DmvFactory.new 
    end

    it 'maps facility data to new array' do
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        facilities = @dmv_factory.create_co_facilities(@co_dmv_office_locations)

        expect(facilities).to all(be_a(Facility))
        expect(facilities).to be_an(Array)
    end

    it 'maps the correct data to the new Colorado Facility objects' do
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        facilities = @dmv_factory.create_co_facilities(@co_dmv_office_locations)

        expect(facilities.first.name).to eq("DMV Tremont Branch")
        expect(facilities.first.address).to eq("2855 Tremont Place, Suite 118, Denver, CO, 80205")
        expect(facilities.first.phone).to eq("(720) 865-4600")
        expect(facilities.first.services).to eq(["vehicle titles", "registration", "renewals;  VIN inspections"])
        expect(facilities.first.registered_vehicles).to eq([])
        expect(facilities.first.collected_fees).to eq(0)
    end

    it 'maps the correct data to the new New York Facility objects' do
        @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
        facilities = @dmv_factory.create_ny_facilities(@ny_dmv_office_locations)

        expect(facilities.first.name).to eq("HUDSON, COUNTY OFFICE")
        expect(facilities.first.address).to eq("560 WARREN STREET, HUDSON, NY, 12534")
        expect(facilities.first.phone).to eq("5188283350")
        expect(facilities.first.services).to eq([])
        expect(facilities.first.registered_vehicles).to eq([])
        expect(facilities.first.collected_fees).to eq(0)
    end

    it 'maps the correct data to the new Missouri Facility objects' do
        @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
        facilities = @dmv_factory.create_mo_facilities(@mo_dmv_office_locations)

        expect(facilities.first.name).to eq("OAKVILLE")
        expect(facilities.first.address).to eq("3164 TELEGRAPH ROAD, ST LOUIS, MO, 63125")
        expect(facilities.first.phone).to eq("(314) 887-1050")
        expect(facilities.first.services).to eq([])
        expect(facilities.first.registered_vehicles).to eq([])
        expect(facilities.first.collected_fees).to eq(0)
    end
end
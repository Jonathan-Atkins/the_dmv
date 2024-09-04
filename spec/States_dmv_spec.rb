require 'spec_helper'


RSpec.describe 'DmvFactory' do
    before(:each) do
      @states_dmv = States_dmv.new
    end

    it  'Maps Data from CO registry' do

        # @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        # facilities = @states_dmv.create_co_facilities(@co_dmv_office_locations)
        
        # expect(facilities).to all(be_a(Facility))
        # expect(facilities).to be_an(Array)

        # expect(facilities.first.name).to eq("DMV Tremont Branch")
        # expect(facilities.first.address).to eq("2855 Tremont Place,Suite 118,Denver,CO,80205")
        # expect(facilities.first.phone).to eq("(720) 865-4600")
        # expect(facilities.first.services).to eq("vehicle titles, registration, renewals;  VIN inspections")
        # expect(facilities.first.registered_vehicles).to eq([])
        # expect(facilities.first.collected_fees).to eq(0)
      end

      it 'Maps the Correct Data from NY regiistry' do
        @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
        facilities = @states_dmv.create_ny_facilities(@ny_dmv_office_locations)

        expect(facilities.first.name).to eq("HUDSON")
        expect(facilities.first.address).to eq("560 WARREN STREET,HUDSON,NY")
        expect(facilities.first.phone).to eq("5188283350")
        expect(facilities.first.services).to eq([])
        expect(facilities.first.registered_vehicles).to eq([])
        expect(facilities.first.collected_fees).to eq(0)
      end 
    end
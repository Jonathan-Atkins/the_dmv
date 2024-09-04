require 'spec_helper'

RSpec.describe DmvFactory do
    before(:each) do
        @dmv_factory = DmvFactory.new
    end

    it 'maps facility to new array' do
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        facilities = @dmv_factory.create_co_facilities(@co_dmv_office_locations)
        expect(facilities).to all(be_a(Facility))
        expect(facilities).to be_an(Array)        
    end

    it 'Maps Colorado Data to new CO Objects' do
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        facilities = @dmv_factory.create_co_facilities(@co_dmv_office_locations)

        expect(facilities.first.name).to eq("DMV Tremont Branch")
        expect(facilities.dmv_id).to eq(1)
    end
    
    
    
end
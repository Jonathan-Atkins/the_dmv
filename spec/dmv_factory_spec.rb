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
end
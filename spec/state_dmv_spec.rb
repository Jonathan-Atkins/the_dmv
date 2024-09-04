require 'spec_helper'

RSpec.describe DMVFactory do
    before(:each) do
        @dmv_factory = DMVFactory.new
    end

    it 'maps facility to new array' do
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        facilities = @dmv_factory.create_CO_facility(@co_dmv_office_locations)

        expect(facilities).





    end
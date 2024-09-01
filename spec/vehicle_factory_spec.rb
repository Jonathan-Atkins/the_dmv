require 'spec_helper'

RSpec.describe VehicleFactory do

    before(:each) do
        @factory = VehicleFactory.new 
    end

    describe 'initialize' do
        it 'can initialize' do
        expect(@factory).to be_an_instance_of(VehicleFactory)
        end
    end

    xit 'creates vehicles' do

        expect(@factory.create_vehicles('https://data.wa.gov/resource/rpr4-cgyd.json')).to eq('https://data.wa.gov/resource/rpr4-cgyd.json')
    end
end
        
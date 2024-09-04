RSpec.describe 'VehicleFactory' do
    before(:each) do
      @states_dmv = DmvFactoy.new
    end

    it  'Maps Data from CO registry' do

        @co_dmv_office_locations = DmvDataService.new.co_dmv_registrations
        facilities = @states_dmv.create_co_facilities(@co_dmv_office_locations)
        
        expect(facilities).to all(be_a(Facility))
        expect(facilities).to be_an(Array)

        expect(facilities.first.name).to eq("DMV Tremont Branch")
      end


end
require 'spec_helper'

RSpec.describe Registrant do

    before(:each) do
        @registrant_1 = Registrant.new("Bruce", 18, true) 
        @registrant_2 = Registrant.new("Penny", 16 )
        @registrant_3 = Registrant.new("Tucker", 15)
    
        @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
        @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    
    end

    describe 'initialize' do
        it 'can initialize' do
        
        expect(@registrant_1).to be_an_instance_of(Registrant)
        expect(@registrant_2).to be_an_instance_of(Registrant)
        end

        it 'identifies a registrants license data' do

        expect(@registrant_1.license_data).to eq({written: false, license: false, renewed: false})
        expect(@registrant_2.license_data).to eq({written: false, license: false, renewed: false})
        end    
    end

    describe 'permit' do
        it 'identifies whether the registrant has a permit' do
            # require 'pry'; binding.pry
        expect(@registrant_1.permit?).to eq(true)
        expect(@registrant_2.permit?).to eq(false)
        end

        it 'adds permit when earned' do
        @registrant_2.earn_permit
    
        expect(@registrant_2.permit?).to eq(true)
        end
    end

        describe 'getting a license' do        

        before(:each) do
            @facility_1.add_service('Written Test')
            @facility_1.administer_written_test(@registrant_1) 
        end

        it 'passes the written test' do
        
        expect(@registrant_1.license_data).to eq({written: true, license: false, renewed: false})
        end

        it 'passes the road test' do
        @facility_1.add_service('Written Test')
        @facility_1.add_service('Road Test')
        @facility_1.administer_written_test(@registrant_1) 
        @facility_1.administer_road_test(@registrant_1)

        expect(@registrant_1.license_data).to eq({written: true, license: true, renewed: false})
        end

        it 'has its license renewed' do
        @facility_1.add_service('Written Test')
        @facility_1.add_service('Road Test')
        @facility_1.add_service('Renew License')
        @facility_1.administer_written_test(@registrant_1) 
        @facility_1.administer_road_test(@registrant_1)
        @facility_1.renew_drivers_license(@registrant_1)

        expect(@registrant_1.license_data).to eq({written: true, license: true, renewed: true})
        expect(@registrant_2.license_data).to eq({written: false, license: false, renewed: false})
        end
    end
end

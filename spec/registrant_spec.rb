require 'spec_helper'

RSpec.describe Registrant do

    before(:each) do
        @registrant_1 = Registrant.new({name: "Bruce", age: 18, permit: true, license_data: {written: false, license: false, renewed: false}})
        @registrant_2 = Registrant.new({name: "Penny", age: 15, permit: false, license_data: {written: false, license: false, renewed: false}})
        @registrant_3 = Registrant.new({name: "Tucker", age: 15, permit: false, license_data: {written: false, license: false, renewed: false}})
    
        @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
        @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    
    end

    describe 'initialize' do
        it 'can initialize' do
        
            expect(@registrant_1).to be_an_instance_of(Registrant)
            expect(@registrant_2).to be_an_instance_of(Registrant)
        end
    end

    describe 'permit' do
        it 'identifies whether the registrant has a permit' do
            # require 'pry'; binding.pry
            expect(@registrant_1.permit?).to eq(true)
            expect(@registrant_2.permit?).to eq(false)
        end
    end

    describe 'license data' do
        it 'identifies a registrants license data' do

            expect(@registrant_1.license_data).to eq({written: false, license: false, renewed: false})
            expect(@registrant_2.license_data).to eq({written: false, license: false, renewed: false})

        end
    end

    describe 'add permit' do
        it 'adds permit when earned' do
            @registrant_2.earn_permit

            expect(@registrant_2.permit?).to eq(true)
        end
    end
end

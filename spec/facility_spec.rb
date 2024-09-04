require 'spec_helper'
# require 'pry'; binding.pry
RSpec.describe Facility do

  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

    @registrant_1 = Registrant.new("Bruce", 18, true) 
    @registrant_2 = Registrant.new("Penny", 16 )
    @registrant_3 = Registrant.new("Tucker", 15)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])

      expect(@facility_2).to be_an_instance_of(Facility)
      expect(@facility_2.name).to eq('DMV Northeast Branch')
      expect(@facility_2.address).to eq('4685 Peoria Street Suite 101 Denver CO 80239')
      expect(@facility_2.phone).to eq('(720) 865-4600')
      expect(@facility_2.services).to eq([])
    end

    it 'starts with an empty array of registered vehicles' do
      expect(@facility.registered_vehicles).to eq([])
    end
  end

  describe '#facility services' do
    it 'starts with an empty array of services' do
      expect(@facility.services).to eq([])
    end

    it 'can add services' do
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')

      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#vehicle registration' do
    before(:each) do
        @facility.add_service('Vehicle Registration')
        @facility.register_vehicle(@cruz)
        @facility.register_vehicle(@camaro)
        @facility.register_vehicle(@bolt)
      end

      it 'cannot perform services it has not added' do
        expect(@facility_2.register_vehicle(@cruz)).to eq(false)
        expect(@facility_2.administer_written_test(@registrant_1)).to eq(false)
      end  

      it 'adds registered vehicles to the facilitys registered vehicles array' do
        expect(@facility.registered_vehicles).to include(@cruz, @camaro, @bolt)
      end  

      it 'identifies if a vehicle is registered' do
      expect(@facility.registered_vehicles).to include(@cruz, @camaro, @bolt)
      expect(@facility_2.registered_vehicles).to eq([])
    end

    it 'adds a registration date when registered' do
      registration_date = Date.today

      expect(@cruz.registration_date).to eq(registration_date)
      expect(@camaro.registration_date).to eq(registration_date)
      expect(@bolt.registration_date).to eq(registration_date)
    end

    it 'adds a plate_type when registered' do
      expect(@cruz.plate_type).to eq(:regular)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.plate_type).to eq(:ev)
    end

    it 'collects regisration fees' do
      expect(@facility.collected_fees).to eq(325)  
    end 
  end

  describe '#getting a drivers license' do
    before(:each) do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')
    end
    it 'administers written tests after written tests are added to a facilitys services' do
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
      expect(@facility_2.administer_written_test(@registrant_1)).to eq(false)
    end

    it 'only administers road tests to registrants who have permits and are 16 or older' do
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
    end

    it 'administers road tests' do
      @facility_1.administer_written_test(@registrant_1)

      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)
      expect(@facility_2.administer_road_test(@registrant_1)).to eq(false)
    end

    it 'renews licenses' do
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)

      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(true)
      expect(@facility_2.renew_drivers_license(@registrant_1)).to eq(false)
    end
  end
end

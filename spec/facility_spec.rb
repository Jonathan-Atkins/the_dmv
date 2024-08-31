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
  end

  describe '#services' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')

      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#vehicle registration' do
    it 'starts with an empty array of registered vehicles' do

      expect(@facility.registered_vehicles).to eq([])
    end

    it 'registers a vehicle' do
      
      date = "Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j"
      @facility_1.register_vehicle(@cruz, date)
      @facility_1.register_vehicle(@camaro, date)
      @facility_1.register_vehicle(@bolt, date)
  
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])

      expect(@cruz.registration_date).to eq(date)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@cruz.registration_fee).to eq(100)

      expect(@camaro.registration_date).to eq(date)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@camaro.registration_fee).to eq(25)

      expect(@bolt.registration_date).to eq(date)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@bolt.registration_fee).to eq(200)

      expect(@facility_1.collected_fees).to eq(325)
    end

    it 'collects registration fees' do
      date = "Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j"
      
      @facility_1.register_vehicle(@cruz, date)

      expect(@facility_1.collected_fees).to eq(100)
    end
  end
end

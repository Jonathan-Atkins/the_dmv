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

    it 'starts with an empty array of registered vehicles' do

      expect(@facility.registered_vehicles).to eq([])
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

  before(:each) do
      @facility.register_vehicle(@cruz)
      @facility.register_vehicle(@camaro)
      @facility.register_vehicle(@bolt)
    end

   it 'identifies if a vehicle is registered' do
    # require 'pry'; binding.pry
      expect(@facility.registered_vehicles).to include(@cruz, @camaro, @bolt)
    end

    it 'adds a registration date when registered' do

      expect(@cruz.registration_date).to eq("Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j")
      expect(@camaro.registration_date).to eq("Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j")
      expect(@bolt.registration_date).to eq("Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j")
    end

    it 'adds a plate_type when registered' do

      expect(@cruz.plate_type).to eq(:regular)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.plate_type).to eq(:ev)
    end

    it 'calculates registration fees' do

      expect(@cruz.registration_fee).to eq(100)
      expect(@camaro.registration_fee).to eq(25)
      expect(@bolt.registration_fee).to eq(200)
    end

    it 'collects regisration fees' do

    expect(@facility.collected_fees).to eq(325)  
    end 
  end
end

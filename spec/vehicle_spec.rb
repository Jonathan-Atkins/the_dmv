require 'spec_helper'

RSpec.describe Vehicle do
  before(:each) do
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end

  describe '#initialize' do
    it 'can initialize' do

      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@cruz.vin).to eq('123456789abcdefgh')
      expect(@cruz.year).to eq(2012)
      expect(@cruz.make).to eq('Chevrolet')
      expect(@cruz.model).to eq('Cruz')
      expect(@cruz.engine).to eq(:ice)
      expect(@cruz.registration_date).to be_nil
      expect(@cruz.plate_type).to eq(nil)
    end
  end

  describe '#antique?' do
    it 'can determine if a vehicle is an antique' do
      expect(@cruz.antique?).to eq(false)
      expect(@bolt.antique?).to eq(false)
      expect(@camaro.antique?).to eq(true)
    end
  end

  describe '#electric_vehicle?' do
    it 'can determine if a vehicle is an ev' do
      expect(@cruz.electric_vehicle?).to eq(false)
      expect(@bolt.electric_vehicle?).to eq(true)
      expect(@camaro.electric_vehicle?).to eq(false)
    end
  end

  describe '#registration' do

  before(:each) do
    @facility.register_vehicle(@cruz)
    @facility.register_vehicle(@camaro)
    @facility.register_vehicle(@bolt)
  end

    it 'adds registered vehicles to the facilitys registered vehicles array' do
      expect(@facility.registered_vehicles).to include(@cruz, @camaro, @bolt)
    end

    it 'adds a registration date when registered' do
      expect(@cruz.registration_date).to eq("Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j")
      expect(@camaro.registration_date).to eq("Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j")
      expect(@bolt.registration_date).to eq("Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j")
    end

    it 'adds a plate type when registered' do
      expect(@cruz.plate_type).to eq(:regular)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.plate_type).to eq(:ev)
    end

    it 'calculates registration fees' do
      expect(@cruz.registration_fee).to eq(100)
      expect(@camaro.registration_fee).to eq(25)
      expect(@bolt.registration_fee).to eq(200)
    end
  end
end

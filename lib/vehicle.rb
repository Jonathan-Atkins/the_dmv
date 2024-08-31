require 'date'
require_relative 'facility'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :plate_type,
              :registration_date, 
              :registration_fee

  def initialize(vehicle_details = {})
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @plate_type = nil
    @registration_date = nil
    @registration_fee = 0
    
  end

  def antique?
    Date.today.year - @year >= 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def regular?
    @engine != :ev && Date.today.year - @year <= 25
  end

  def add_registration_date(date)
    @registration_date = date
    calculate_fees
  end

  def assign_plate_type(type)
    @plate_type = type
  end

  def calculate_fees
    if antique?
      @registration_fee = 25
    elsif electric_vehicle?
      @registration_fee = 200
    else 
      @registration_fee = 100
    end
  end
end

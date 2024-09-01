require 'date'

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

  def calculate_fees
    @registration_fee = 
      case plate_type
      when :antique then 25
      when :ev then 200
      else 100
      end
  end

  def assign_plate_type
    @plate_type = 
      case
      when antique? then :antique
      when electric_vehicle? then :ev
      else :regular
      end
  end
  
  def register(date) 
    @registration_date = date
    
    assign_plate_type
    calculate_fees
  end
end

require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :plate_type,
              :registration_date

  attr_writer :registration_date, :plate_type

  def initialize(vehicle_details = {})
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @plate_type = nil
    @registration_date = nil
    
  end

  def antique?
    Date.today.year - @year >= 25
  end

  def electric_vehicle?
    @engine == :ev
  end

 
  # def register(date) 
  #   @registration_date = date
    
  #   assign_plate_type #should be in the facility class
  #   calculate_fees
  # end
end

require 'pry'
require './lib/facility'
require './lib/vehicle'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = facility_details[:services] || []
    @collected_fees = 0
    @registered_vehicles = []
  end
  
  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)    
    return nil unless @services.include?('Vehicle Registration')    

    unless @registered_vehicles.include?(vehicle)
      @registered_vehicles << vehicle
      vehicle.registration_date = Date.today  

      #require 'pry'; binding.pry

      if vehicle.antique?
        @collected_fees += 25
        vehicle.plate_type = :antique
      elsif vehicle.electric_vehicle?
        @collected_fees += 200
        vehicle.plate_type = :ev
      else
        @collected_fees += 100
        vehicle.plate_type = :regular
      end
    end
    @registered_vehicles
  end

  def administer_written_test(registrant)
    return false unless @services.include?('Written Test') 
    return false unless registrant.permit? == true

    registrant.licensed_data[:written] = true
    registrant.licensed_data[:written]
  end

  def administer_road_test(registrant)
    return false unless @services.include?('Road Test') && registrant.licensed_data[:written] = true 

    registrant.licensed_data[:license] = true
    registrant.licensed_data[:license]
  end
end



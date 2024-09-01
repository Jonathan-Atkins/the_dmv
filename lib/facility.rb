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
      vehicle.set_registration_date(Date.today)
    end
  end
end
binding.pry


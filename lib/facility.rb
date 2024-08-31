class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_details = {})
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle, date)
    @registered_vehicles << vehicle
    vehicle.add_registration_date(date)

    if vehicle.antique?
      vehicle.assign_plate_type(:antique)
    elsif vehicle.electric_vehicle?
      vehicle.assign_plate_type(:ev)
    else
      vehicle.assign_plate_type(:regular)
    end
    
    vehicle.calculate_fees
    collect_fee(vehicle.registration_fee)
  end

  def collect_fee(amount)
    @collected_fees += amount
  end
end

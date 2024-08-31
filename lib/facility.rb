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

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
  end

  def add_registration_date(vehicle, date)
    if @registered_vehicles.include?(vehicle)
      vehicle.add_registration_date(date)
    end
  end

  def add_plate_type(vehicle, plate_type)
    if @registered_vehicles.include?(vehicle)
      vehicle.add_plate_type(plate_type)
    end
  end

  def collect_fees(vehicle, fee)
    if @registered_vehicles.include?(vehicle)
      vehicle.collect_fees(fee)  
    end
  end
end

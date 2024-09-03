class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees 

  attr_writer :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees

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

  def assign_plate_type(vehicle)
    if vehicle.antique?
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev
    else
      vehicle.plate_type = :regular
    end
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
        vehicle.registration_date = Date.today
        assign_plate_type(vehicle)
        calculate_fees(vehicle)
        @registered_vehicles << vehicle
    else
      false
    end
  end

  def calculate_fees(vehicle)
    @collected_fees += if vehicle.plate_type == :regular
      100
    elsif vehicle.plate_type == :ev
      200
    else
      25
    end
  end

  def administer_written_test(registrant)
    return false unless @services.include?("Written Test")
    return false unless registrant.permit? == true && registrant.age >= 16

    registrant.license_data[:written] = true
  end

  def administer_road_test(registrant)
    return false unless @services.include?("Road Test")
    return false unless registrant.license_data[:written] == true 
      registrant.license_data[:license] = true
  end

  def renew_drivers_license(registrant)
    return false unless @services.include?("Renew License")
    return false unless registrant.license_data[:license] == true

        registrant.license_data[:renewed] = true
  end
end

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees, :default_registration_date

  def initialize(facility_details = {})
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @default_registration_date = "Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j"

  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
        vehicle.register(@default_registration_date)
        collect_fees(vehicle.registration_fee) 
        @registered_vehicles << vehicle
    else
      false
    end
  end

  def collect_fees(amount)
    @collected_fees += amount
  end

  def administer_written_test(registrant)
    if 
      @services.include?("Written Test") && 
      registrant.permit? == true && 
      registrant.age >= 16
      true
    else
      false
    end
  end
end

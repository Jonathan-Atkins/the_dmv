require 'faraday'
require 'json'

class VehicleFactory
    def create_vehicles(wa_ev_registrations)
        wa_ev_registrations.map do |vehicle_data|
            Vehicle.new(
                engine: :ev,
                make: vehicle_data[:make],
                model: vehicle_data[:model],
                plate_type: vehicle_data[:plate_type],
                registration_date: vehicle_data[:registration_date],
                vin: vehicle_data[:vin_1_10],
                year: vehicle_data[:model_year]
            )
        end
    end
end
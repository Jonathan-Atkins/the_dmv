require 'faraday'
require 'json'

class VehicleFactory
    def self.create_vehicles(wa_ev_registrations)
        wa_ev_registrations.map do |vehicle|
            {
                engine_type: vehicle[:ev],
                make: vehicle[:make],
                model: vehicle[:model],
                plate_type: vehicle[:plate_type],
                registration_date: vehicle[:registration_date],
                vin: vehicle[:vin],
                year: vehicle[:year]
            }
        end
    end
end
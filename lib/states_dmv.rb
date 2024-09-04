require 'faraday'
require 'json'

class States_dmv
    def initialize
    end
    
    def create_co_facilities(co_dmv_office_locations)
        co_dmv_office_locations.map do |facility_data|
            facility = Facility.new(
                name: facility_data[:dmv_office],
                address: [
                    facility_data[:address_li],
                    facility_data[:address__1],
                    facility_data[:city],
                    facility_data[:state],
                    facility_data[:zip] 
                ].compact.join(','),
                phone: facility_data[:phone],
                registered_vehicles: facility_data[:registered_vehicles],
                collected_fees: facility_data[:services_p]
            )
        end
    end
end



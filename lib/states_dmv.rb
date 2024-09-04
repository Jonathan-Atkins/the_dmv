require 'faraday'
require 'json'

class States_dmv
    def initialize
    end
    
    def create_co_facilities(co_dmv_office_locations)
        co_dmv_office_locations.map do |facility_data|
            Facility.new(
                name: facility_data[:dmv_office],
                address: [
                    facility_data[:address_li],
                    facility_data[:address__1],
                    facility_data[:city],
                    facility_data[:state],
                    facility_data[:zip] 
                ].compact.join(','),
                phone: facility_data[:phone],
                services: facility_data[:services_p],
                registered_vehicles: facility_data[:registered_vehicles],
                collected_fees: facility_data[:services_p]
            )
        end
    end

    def create_ny_facilities(ny_dmv_office_locations)
        ny_dmv_office_locations.map do |facility_data|    
            Facility.new(
                name: facility_data[:office_name],
                phone: facility_data[:public_phone_number],
                address: [
                    facility_data[:street_address_line_1],
                    facility_data[:city],
                    facility_data[:state],
                    # was not able to concatinate facility_data[:zip].to_s
                ].compact.join(','),
                registered_vehicles: facility_data[:registered_vehicles],
                collected_fees: facility_data[:collected_fees]
                )
            end
        end
   
end



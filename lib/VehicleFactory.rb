class VehicleFactory

    attr_reader 
    def create_vehicles(data)
      vehicles = []
      data.each do |vehicle_data|
        vehicle_data.default = 'nil'
        vehicle = Vehicle.new({
          :vin => vehicle_data[:vin],  
          :year => vehicle_data[:year],  
          :make => vehicle_data[:make],
          :model => vehicle_data[:model],
          :engine => :ev
        })
        vehicles << vehicle
      end
      vehicles
    end
  end
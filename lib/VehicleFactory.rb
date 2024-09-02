class VehicleFactory
    def create_vehicles(data)
      vehicles = []
      data.each do |vehicle_data|
        vehicle = Vehicle.new({
          vin: vehicle_data[:vin_1_10],  # Use the full VIN field if available
          year: vehicle_data[:model_year],  # Use model_year as provided in the dataset
          make: vehicle_data[:make],
          model: vehicle_data[:model],
          engine: :ev
        })
        vehicles << vehicle
      end
      vehicles
    end
  end
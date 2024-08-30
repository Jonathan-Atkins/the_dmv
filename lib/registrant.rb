class Registrant

    attr_reader :name, :age, :license_data, :written, :license, :renewed, :permit
  
    def initialize(registrant_info = {})
      @name = registrant_info[:name]
      @age = registrant_info[:age]
      @license_data = registrant_info[:license_data] || {written: false, license: false, renewed: false}
      @permit = registrant_info[:permit]
    end

    def permit?
        @permit
    end


    def earn_permit
        @permit = true
    end

end

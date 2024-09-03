class Registrant

    attr_reader :name, :age, :license_data, :permit
    attr_writer :license_data
  
    def initialize(name, age, permit = false)
      @name = name
      @age = age
      @permit = permit
      @license_data = {written: false, license: false, renewed: false}
    end

    def permit?
        @permit
    end

    def earn_permit
        return false unless age >= 15
        @permit = true
    end
end

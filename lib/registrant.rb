require './lib/registrant'
require './lib/facility'


class Registrant
    attr_reader :name, :age , :permit, :licensed_data
    attr_writer :licensed_data

    def initialize(name,age,permit = false)
        @name = name
        @age = age
        @permit = permit
        @licensed_data  = {:written => false, :license => false, :renewed => false}
    end

    def permit?
        @permit
    end

    def earn_permit
        @permit = true unless @age < 16  
    end


end
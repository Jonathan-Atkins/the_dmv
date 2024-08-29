require 'spec_helper'

RSpec.describe Registrant do

  before(:each) do
    @registrant_1 = Registrant.new({name: "Bruce", age: 18, permit: true, license_data: {written: false, license: false, renewed: false}})
    @registrant_2 = Registrant.new({name: "Penny", age: 15, permit: false, license_data: {written: false, license: false, renewed: false}})
  end

  describe '#initialize' do
    it 'can initialize' do
        # require 'pry';binding.pry
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_2).to be_an_instance_of(Registrant)
    end
end
end

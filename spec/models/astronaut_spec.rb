require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'class methods' do
    it 'should calculate average age for all astronauts' do
      astronaut_1 = Astronaut.create(name: "Jon", age: 35, job: "Captain")
      astronaut_2 = Astronaut.create(name: "Jane", age: 32, job: "Lead Scientist")

      expect(Astronaut.average_age).to eq(33.5)
    end
  end
end

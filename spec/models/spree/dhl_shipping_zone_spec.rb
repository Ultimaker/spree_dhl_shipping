require 'spec_helper'

describe Spree::DhlShippingZone do
  describe 'attributes' do
    it { should allow_mass_assignment_of :method }
    it { should allow_mass_assignment_of :name }
  end

  describe 'associations' do
    it { should have_many(:country_zones).class_name('Spree::DhlCountryZone') }
  end

  describe 'validations' do
    it { should validate_presence_of(:method) }
    it { should validate_presence_of(:name) }
  end
end

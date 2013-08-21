require 'spec_helper'

describe Spree::DhlCountryZone do
  describe 'attributes' do
    it { should allow_mass_assignment_of :country }
    it { should allow_mass_assignment_of :zip_codes }
    it { should_not allow_mass_assignment_of :shipping_zone }
  end

  describe 'associations' do
    it { should belong_to(:country).class_name('Spree::Country') }
    it { should belong_to(:shipping_zone).class_name('Spree::DhlShippingZone') }
  end

  describe 'validations' do
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:shipping_zone) }
    it { should validate_uniqueness_of(:country_id).scoped_to(:shipping_zone_id) }
  end
end

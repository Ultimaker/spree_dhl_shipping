require 'spec_helper'

describe Spree::DhlShippingZone do
  describe 'associations' do
    it { should have_many(:country_zones).class_name('Spree::DhlCountryZone') }
  end

  describe 'validations' do
    it { should validate_presence_of(:shipping_method) }
    it { should validate_presence_of(:name) }
  end
end

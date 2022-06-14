require 'rails_helper'
require 'spec_helper'
require 'factory_bot'

RSpec.describe Item, type: :model do
  it { is_expected.to belong_to :card }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :price }
  it { should define_enum_for(:category) }
  it { is_expected.to validate_length_of(:title).is_at_least(3).is_at_most(128) }
  it { should validate_numericality_of(:price).is_greater_than(0) }
  
  it do
    is_expected.to define_enum_for(:category).
      with_values(Traveling: 0, Clothing: 1, Taxi: 2, Cafes: 3, Shops: 4, Other: 5 ).
      backed_by_column_of_type(:integer)
  end
end
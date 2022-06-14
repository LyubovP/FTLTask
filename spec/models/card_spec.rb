require "rails_helper"

RSpec.describe Card, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { should define_enum_for(:category) }
  it { should define_enum_for(:currency) }
  it { is_expected.to validate_length_of(:title).is_at_least(3).is_at_most(128) }
  it { is_expected.to validate_length_of(:description).is_at_least(5).is_at_most(300) }
  
  it do
    is_expected.to define_enum_for(:category).
      with_values(Trip: 0, Event: 1, House: 2, Shoping: 3).
      backed_by_column_of_type(:integer)
  end
  
  it do
    is_expected.to define_enum_for(:currency).
      with_values(UAH: 0, USD: 1).
      backed_by_column_of_type(:integer)
  end
end
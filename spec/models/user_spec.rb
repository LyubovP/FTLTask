require 'rails_helper'

RSpec.describe do
  it "has a valid factory" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end
end
require "rails_helper"
require 'spec_helper'

RSpec.describe "Cards requests", type: :request do

  before(:each)do
    sign_in(user)
  end
 
  let!(:user)         {create(:user)}
  let!(:card) { create(:card) }
  let!(:card_params) { attributes_for(:card) }
  
 
  
  describe "GET #new" do
    it "renders :new" do
      get new_card_path
   
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "create Card" do
      expect {
        post cards_path(card), params: { card: card_params }
      }.to change { Card.count }.by(1)

      expect(response).to redirect_to(root_path)
    end

    it "renders :new if creating fails" do
      post cards_path(card), params: {card: { title: "" } }
      
      expect(response).to have_http_status(:success)
    end
  end
end    
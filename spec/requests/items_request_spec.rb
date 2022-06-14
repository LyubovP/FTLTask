require "rails_helper"
require 'spec_helper'

RSpec.describe "Items requests", type: :request do

  before(:each)do
    sign_in(user)
  end
 
  let!(:user)         {create(:user)}
  let!(:card) { create(:card, user_id: user.id) }
  let!(:item) { create(:item, card_id: card.id, user_id: user.id) }
  let!(:item_params) { attributes_for(:item) }
  
 
  
  describe "GET #new" do
    it "renders :new" do
      get new_card_item_path(card, item)
   
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "renders :show" do
      get card_item_path(card, item)

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "create item" do
      expect {
        post card_items_path(card), params: { item: item_params }
      }.to change { Item.count }.by(1)

      expect(response).to redirect_to(card_path(card))
    end

    it "renders :new if creating fails" do
      post card_items_path(card), params: { item: { title: "" } }
      
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST #update" do
    it "updates item" do
      put card_item_path(card, item), params: { item: item_params }

      expect(response).to redirect_to(card_path(card))
    end

    it "renders :edit if updating fails" do
      put card_item_path(card, item), params: { item: { title: "" } }
      
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "deletes item" do
      expect {
        delete card_item_path(card, item)
      }.to change { Item.count }.from(1).to(0)
      expect(response).to redirect_to(card_path(card))
    end
  end
end    
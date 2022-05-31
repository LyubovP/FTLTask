class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_card, only: [:show, :edit, :update, :destroy]
  
  def index
    @cards = current_user.cards
  end
  
  def show
    @item = @card.items.build
  end
  
  def new
    @card = collection.build
  end

  def create
    @card = collection.build(card_params)

    if @card.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @card.update(card_params)
      flash[:notice] = "Card has been updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    flash[:notice] = "Card has been deleted"
    redirect_to root_path
  end

  private

  def collection
    current_user.cards
  end
  
  def find_card
    @card = collection.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :description, :category, :currency)
  end
  
  def item_collection
    find_card.items
  end
end

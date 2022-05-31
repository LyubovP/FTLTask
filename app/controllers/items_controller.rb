class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_card
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = @card.items
  end

  def show
    #@item = current_user.items.find(params[:id])
    #@card =current_user.cards.find(params[:card_id])
    # @user_email = @card.users.find(@item.user_id).email
  end

  def new
    @item= @card.items.build
  end
  
  def edit; end
    
  def create
    @item = @card.items.build(item_params)
    flash[:notice] = "item has been create"

    if @item.save
      redirect_to(@item.card)
    else
      flash[:error] = @item.errors.full_messages[0]
      render :new
    end
  end

  

  def update
    if @item.update(item_params)
      flash[:notice] = "Item has been update"
      redirect_to(@item.card)
    else
      render :edit
    end
  end

  def destroy
    redirect_to @card if @item.destroy
    flash[:notice] = "Item has been deleted"
  end

  private
  
  def find_card
    @card = current_user.cards.find(params[:card_id])
  end

  def find_item
    @item = @card.items.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:title, :price, :card_id, :user_id)
  end
end

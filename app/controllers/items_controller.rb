class ItemsController < ApplicationController

  before_action :authorize

  def index
    @user = User.find(params[:user_id])
    @items = @user.items.all
  end

  def new
    @item = Item.new
  end

  def create
    user = current_user
    @item = Item.new(item_params)
    user.items.push(@item)

    if @item.save
      redirect_to user_items_path(current_user)
    else
      render "new"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.users.delete(current_user)

    if @item.posts.blank?
      @item.destroy
    end

    redirect_to user_path(current_user)
  end

  private

  def item_params
    params.require(:item).permit(
      :title,
      :description,
      :completed,
      :date_completed
    )
  end

end

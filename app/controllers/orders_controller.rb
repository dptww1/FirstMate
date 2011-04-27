class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @squadrons_ship = SquadronsShip.find(params[:ss_id])
    @orders = Order.where(:squadrons_ship_id => params[:ss_id]).order("turn DESC")
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
  end

  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(edit_order_path(@order), :notice => "orders updated")}
      end
    end
  end
end

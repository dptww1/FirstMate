class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @squadrons_ship = SquadronsShip.find(params[:ss_id])
    @orders = Order.where(:squadrons_ship_id => params[:ss_id]).order("turn DESC")
  end

  def edit
    @order = Order.find(params[:id])
  end

  def new
    @squadrons_ship = SquadronsShip.find(params[:ss_id])
    @order = Order.new(:squadrons_ship_id => params[:ss_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml { reder :ml => @order }
    end
  end

  def create
    @squadrons_ship = SquadronsShip.find(params[:ss_id])
    @order = Order.new(params[:order])
    @order.update_attributes :squadrons_ship => @squadrons_ship, :user_id => @current_user.id

    respond_to do |format|
      if @order.save
        format.html { redirect_to(game_path(@order.squadrons_ship.squadron.game), :notice => "#{@squadrons_ship.name} orders entered")}
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @order = Order.find(params[:id])
    @ss = @order.squadrons_ship

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(game_path(@ss.squadron.game), :notice => "#{@ss.name} orders updated") }
      else
        format.html { render :action => "edit" }
      end
    end
  end
end

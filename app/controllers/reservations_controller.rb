class ReservationsController < ApplicationController

  def index
    @user = User.find(1)
    @rooms = Room.all
    @reservations = @user.reservations 
    
  end

  def new
    @reservation = Reservation.new(reservations_params)
    @room = Room.find(params[:room_id])
    @reservation.room_id = @room.id
    if @reservation.invalid?
        render "rooms/show"
    else
      price = @room.money
      reserver = @reservation.people
      days = (@reservation.end_date - @reservation.start_date).to_i
      @reservation.total_price = (days * reserver * price).to_i
    end

  end

  def show
    @user = current_user.id
    @reservations = Reservation.where(user_id: @user)
    @reservations_roomid = Reservation.select(:room_id).where(user_id: @user)
    @rooms = Room.where(id: @reservations_roomid)

  end
  
  def create
    @user = current_user.id
    @reservation = Reservation.new(reserve_params)
    @room = Room.find_by(params[:room_id])
    @reservation.room_id = @room.id
    
    if @reservation.save
      flash[:notice] = "予約を完了しました"
      redirect_to  reservations_path(@reservation)
    else
      render "rooms/show"
      flash[:notice] = "予約に失敗しました"
    end

  end
  
  
  
  private
  def reservations_params
    params.permit(:start_date, :end_date, :people).merge(user_id: current_user.id)
  end
  def reserve_params 
    params.require(:reservation).permit(:start_date, :end_date, :people, :total_price).merge(user_id: current_user.id)
  end

end

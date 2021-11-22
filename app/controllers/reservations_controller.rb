class ReservationsController < ApplicationController

  def index
  end

def new
  @reservation = Reservation.new(reservations_params)
  @room = Room.find_by(params[:id])
  price = @room.money
  reserver = @reservation.people
  days = (@reservation.end_date - @reservation.start_date).to_i
  
  @reservation.total_price = (days * reserver * price).to_i

end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.find_by(params[:id])
    price = @room.money
    reserver = @reservation.people
    days = (@reservation.end_date - @reservation.start_date).to_i
    @reservation.total_price = (days * reserver * price).to_i
  end
  
  def create
    @reservation = Reservation.new(reserve_params)
    @room = Room.find(params[:id])
    @reservation.room_id = @room.id
    
    if @reservation.save
      flash[:notice] = "予約を完了しました"
      redirect_to  reservation_path(@reservation)
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

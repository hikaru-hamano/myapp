class ReservationsController < ApplicationController

  def index
  end

def new
  @reservation = Reservation.new(reservation_params)
  @room = Room.find_by(params[:id])
  @price = @room.money
  @reserver = @reservation.people
  @days = (@reservation.end_date - @reservation.start_date).to_i
  
  @reservation.total_price = @days * @reserver * @price

end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.find(params[:id])
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:id])
    @reservation.id = @room.id

    if @reservation.save
      flash[:notice] = "予約を完了しました"
      redirect_to  reservation_path(id: @reservation.id)
    else
      render "rooms/show"
      flash[:notice] = "予約に失敗しました"
    end

  end
  
  
  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :people, :total_price).merge(user_id: current_user.id)
  end

end

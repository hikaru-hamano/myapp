class ReservationsController < ApplicationController
  def index
  end

  def new
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:id])
    @date_gap = @reservation.date_gap.to_i
    
    def total_price
      @room.money * @reservation.people * @date_gap
    end
  end

  def show
    @reservation = Reservation.find(params)[:id]
    @reservations = Reservation.all
    @rooms = Room.all
  end
  
  def create
    @reservation = current_user.reservations.create(reservation_params)
    if @reservation.save
      flash[:notice] = "予約を完了しました"
      redirect_to room_reservation_path(id: @reservation.id)
    else
      render :new
    end
  end
  
  private
   def reservation_params
     params.require(:reservation).permit(:start_date, :end_date, :money, :people, :total_price, :room_id).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end

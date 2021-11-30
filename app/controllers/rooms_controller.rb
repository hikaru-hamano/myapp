class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to room_path(@room), notice: "投稿しました"
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
    if @room.user != current_user
      redirect_to rooms_path, alert: "不正なアクセスです。"
    end
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render :edit
    end
  end
  
  def check
   
 @user = current_user.id
    @reservations = Reservation.where(user_id: @user)
    @reservations_roomid = Reservation.select(:room_id).where(user_id: @user)
    @rooms = Room.where(id: @reservations_roomid)
  end
  
  def search
    if params[:search_area].present?
      @rooms= Room.paginate(page: params[:page], per_page: 100).search_area(params[:search_area])
    else 
      @rooms= Room.paginate(page: params[:page], per_page: 100).search_key(params[:search_key])
    end
    
    if params[:search_area].present?
      @rooms_count = Room.paginate(page: params[:page], per_page: 5).search_area(params[:search_area]).count
    else
      @rooms_count = Room.paginate(page: params[:page], per_page: 5).search_key(params[:search_key]).count
    end
  end
  
    
  
  private
  def room_params
    params.require(:room).permit(:title, :body, :money, :address, :image)
  end
  
  def preload
    today = Date.today
    reservations = @room.reservations.where("start_date >= ? OR end_date >= ?", today, today)
    render json: reservations
  end
  #　予約 終了日のAJAX
  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    output = {
      conflict: is_conflict(start_date, end_date, @room)
    }
    render json: output
  end
  
  
end

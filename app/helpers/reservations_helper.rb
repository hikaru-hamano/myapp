module ReservationsHelper
  def total_price
    @total_price = @price * @reserver * @days
  end
    def price
      @room.money = @price
    end
    def reserver
      @reservation.people = @reserver
    end
    def days
     (self.end_date - self.start_date).to_i = @days
    end
end


[1mFrom:[0m /home/ec2-user/environment/myapp/app/controllers/reservations_controller.rb:24 ReservationsController#new:

     [1;34m5[0m: [32mdef[0m [1;34mnew[0m
     [1;34m6[0m:   @reservation = [1;34;4mReservation[0m.new(reservation_params)
     [1;34m7[0m:   @room = [1;34;4mRoom[0m.find_by(params[[33m:id[0m])
     [1;34m8[0m:   @people = @reservation.people
     [1;34m9[0m:   @days = @reservation.days
    [1;34m10[0m:   @reservation.total_price = @total_price
    [1;34m11[0m:   
    [1;34m12[0m:   [32mdef[0m [1;34mtotal_price[0m
    [1;34m13[0m:     @total_price = @price * @people * @days
    [1;34m14[0m:   [32mend[0m
    [1;34m15[0m:   [32mdef[0m [1;34mprice[0m
    [1;34m16[0m:     @room.money = @price
    [1;34m17[0m:   [32mend[0m
    [1;34m18[0m:   [32mdef[0m [1;34mpeople[0m
    [1;34m19[0m:     @reservation.people = @people
    [1;34m20[0m:   [32mend[0m
    [1;34m21[0m:   [32mdef[0m [1;34mdays[0m
    [1;34m22[0m:     ([1;36mself[0m.end_date - [1;36mself[0m.start_date).to_i
    [1;34m23[0m:   [32mend[0m
 => [1;34m24[0m:   binding.pry
    [1;34m25[0m: [32mend[0m


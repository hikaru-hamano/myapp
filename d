
[1mFrom:[0m /home/ec2-user/environment/myapp/app/controllers/reservations_controller.rb:26 ReservationsController#create:

    [1;34m22[0m:   [32mdef[0m [1;34mcreate[0m
    [1;34m23[0m:     @reservation = [1;34;4mReservation[0m.new(reserve_params)
    [1;34m24[0m:     @room = [1;34;4mRoom[0m.find(params[[33m:id[0m])
    [1;34m25[0m:     @reservation.room_id = @room.id
 => [1;34m26[0m: binding.pry
    [1;34m27[0m:     [32mif[0m @reservation.save
    [1;34m28[0m:       flash[[33m:notice[0m] = [31m[1;31m"[0m[31m予約を完了しました[1;31m"[0m[31m[0m
    [1;34m29[0m:       redirect_to  reservation_path(@reservation)
    [1;34m30[0m:     [32melse[0m
    [1;34m31[0m:       render [31m[1;31m"[0m[31mrooms/show[1;31m"[0m[31m[0m
    [1;34m32[0m:       flash[[33m:notice[0m] = [31m[1;31m"[0m[31m予約に失敗しました[1;31m"[0m[31m[0m
    [1;34m33[0m:     [32mend[0m
    [1;34m34[0m: 
    [1;34m35[0m:   [32mend[0m


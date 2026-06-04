local Translations = {
    error = {
        no_people_nearby = "Không có ai ở gần đây",
        no_vehicle_found = "Không tìm thấy phương tiện",
        extra_deactivated = "Phụ kiện (Extra) %{extra} đã được tắt",
        extra_not_present = "Phụ kiện %{extra} không tồn tại trên phương tiện này",
        not_driver = "Bạn không phải là người lái xe",
        vehicle_driving_fast = "Phương tiện đang di chuyển quá nhanh",
        race_harness_on = "Bạn đang đeo dây đai đua xe; không thể đổi chỗ",
        obj_not_found = "Không thể tạo đối tượng được yêu cầu",
        not_near_ambulance = "Bạn không ở gần xe cứu thương",
        far_away = "Bạn đang ở quá xa",
        not_kidnapped = "Bạn không bắt cóc người này",
        trunk_closed = "Cốp xe đang đóng",
        cant_enter_trunk = "Bạn không thể vào cốp xe này",
        already_in_trunk = "Bạn đã ở trong cốp xe rồi",
        cancel_task = "Đã hủy bỏ hành động",
        someone_in_trunk = "Đã có người trong cốp xe",
        no_vehicle_nearby = "Không có phương tiện nào gần đây để lật."
    },
    progress = {
        flipping_car = "Đang lật xe..."
    },
    success = {
        extra_activated = "Phụ kiện (Extra) %{extra} đã được bật",
        entered_trunk = "Bạn đã vào trong cốp xe",
        flipped_car = "Đã lật xe thành công!"
    },
    info = {
        no_variants = "Dường như không có biến thể nào cho mục này",
        wrong_ped = "Mẫu nhân vật này không cho phép tùy chọn này",
        nothing_to_remove = "Bạn không có gì để tháo ra",
        already_wearing = "Bạn đang mặc món đồ đó rồi",
    },
    general = {
        command_description = "Mở Menu vòng",
        get_out_trunk_button = "[E] Thoát khỏi cốp xe",
        close_trunk_button = "[G] Đóng cốp xe",
        open_trunk_button = "[G] Mở cốp xe",
        getintrunk_command_desc = "Vào cốp xe",
        putintrunk_command_desc = "Đưa người chơi vào cốp xe",
        gang_radial = "Băng đảng",
        job_radial = "Công việc"
    },
    options = {
        flip = 'Lật xe',
        vehicle = 'Phương tiện',
        emergency_button = "Nút khẩn cấp",
        driver_seat = "Ghế lái",
        passenger_seat = "Ghế phụ",
        other_seats = "Ghế khác",
        rear_left_seat = "Ghế sau trái",
        rear_right_seat = "Ghế sau phải"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
-- Client-side handler để mở menu metadata
RegisterNetEvent('sgx-adminmenu:client:OpenMetadataMenu', function(playerData)
    local input = lib.inputDialog('Chỉnh sửa thông tin - ' .. playerData.name, {
        {
            type = 'input',
            label = 'Tên',
            description = 'Họ và tên người chơi',
            default = playerData.charinfo.firstname .. ' ' .. playerData.charinfo.lastname,
            required = true
        },
        {
            type = 'input',
            label = 'Ngày tháng năm sinh',
            description = 'Định dạng: DD/MM/YYYY',
            default = playerData.charinfo.birthdate,
            required = true
        },
        {
            type = 'input',
            label = 'Mã số ngân hàng',
            description = 'Số tài khoản ngân hàng của người chơi',
            default = playerData.charinfo.account,
            required = true
        },
        {
            type = 'input',
            label = 'Số điện thoại',
            description = 'Số điện thoại của người chơi',
            default = playerData.charinfo.phone,
            required = true
        }
    })

    if not input then return end

    -- Tách tên thành firstname và lastname
    local fullname = input[1]
    local firstname, lastname = fullname:match("(%S+)%s+(.+)")
    if not firstname or not lastname then
        firstname = fullname
        lastname = ""
    end

    -- Gửi cập nhật lên server
    TriggerServerEvent('sgx-adminmenu:server:UpdatePlayerInfo', playerData.id, {
        firstname = firstname,
        lastname = lastname,
        birthdate = input[2],
        account = input[3],
        phone = input[4]
    })

    QBCore.Functions.Notify('Đã cập nhật thông tin cho ' .. playerData.name, 'success')
end)

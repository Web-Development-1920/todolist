module UsersHelper
    def admin_check(data)
        if data
            "Yes"
        else
            "No"
        end
    end
end
module UsersHelper
    def admin_check(data)
        if data
            "Yes"
        else
            "No"
        end
    end
    
    def find_notifications
        @n_notifications = Notification.where(user_id: current_user.id, read: false).count
    end
end
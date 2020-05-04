module ApplicationHelper
    def resource_name
        :user
    end

    def resource
        @resource ||= User.new
    end

    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end

    def find_notifications
        Notification.where(user_id: current_user.id, read: false).count
    end
end
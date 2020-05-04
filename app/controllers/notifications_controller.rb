class NotificationsController < ApplicationController
    def update
        @notification = current_user.notifications.find(params[:id]) or record_not_found
        @notification.update(notification_params)
    end

    private
        def notification_params
            params.permit(:read)
        end
end
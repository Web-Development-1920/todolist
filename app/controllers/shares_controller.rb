class SharesController < ApplicationController
    before_action :authenticate_user!

    def index
    end

    def new
        @sahre = Share.new
    end

    def create
        @share = Share.new(share_params_new)

        if @share.save
            @notification = Notification.new(:user_id => share_params_new[:user_id], :data => current_user.username + " shared a project with you", :is_new_share => true)
            @notification.save
        end
    end

    def show
    end

    def edit
    end

    def update
        @share.update(share_params)
    end

    def destroy
        @share.destroy
    end

    private
        def share_params_new
            params.permit(:user_id, :project_id, :accepted)
        end
        
        def share_params
            params.require(:share).permit(:accepted)
        end
end
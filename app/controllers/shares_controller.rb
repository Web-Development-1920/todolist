class SharesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_share, only: [:destroy, :update]

    def index
    end

    def new
    end

    def create
        @share = Share.new(share_params_new)

        if @share.save
            @notification = Notification.new(:user_id => share_params_new[:user_id], :data => current_user.username + " shared a project with you", :share_id => @share.id)
            @notification.save

            redirect_to project_path(share_params_new[:project_id]), notice: "Project shared"
        end
    end

    def show
    end

    def edit
    end

    def update
        @share.update(share_params)

        redirect_to project_path(@share.project_id), notice: "Invitation accepted"
    end

    def destroy
        @share.destroy

        redirect_to todolist_index_path, notice: "Invitation declined"
    end

    private
        def find_share
            @share = Share.find(params[:id])
        end

        def share_params_new
            params.permit(:user_id, :project_id, :accepted)
        end
        
        def share_params
            params.permit(:accepted)
        end
end
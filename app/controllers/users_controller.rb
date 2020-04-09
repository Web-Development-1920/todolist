class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:new, :create]
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to todolist_index_path, notice: "User created"
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to @user, notice: "User updated"
        else
            render 'edit'
        end
    end

    def destroy
        @user.destroy

        if @user.destroy
            redirect_to todolist_index_path, notice: "User deleted"
        end
    end

    private
        def find_user
            @user = User.find(params[:id]) or record_not_found
        end

        def user_params
            params.require(:user).permit(:name, :surname, :username, :password, :email)
        end
end
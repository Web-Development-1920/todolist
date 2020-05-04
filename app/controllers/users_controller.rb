class UsersController < ApplicationController
    before_action :authenticate_user!, :is_admin
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :find_projects, :find_tasks, only: [:edit]
    before_action :find_project, :find_task, only: [:update]

    def index
        @users = User.all
    end

    def show
    end

    def edit
    end

    def update
        if @user.update(user_params)
            assign_task
            assign_project
            redirect_to @user, notice: "User updated"
        else
            find_tasks
            find_projects
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
        def is_admin
            if !current_user.admin?
                route_not_found
            end
        end

        def find_user
            @user = User.find(params[:id]) or record_not_found
        end

        def find_tasks
            @tasks = Task.all
        end

        def find_projects
            @projects = Project.all
        end

        def find_task
            begin
                @task = Task.find(task_params[:tasks])
            rescue ActiveRecord::RecordNotFound => rnf
                @task = nil
            end
        end

        def find_project
            begin
                @project = Project.find(task_params[:tasks])
            rescue ActiveRecord::RecordNotFound => rnf
                @project = nil
            end
        end

        def assign_project
            if @project
                @project.user_id = @user.id
                @project.save
            end
        end

        def assign_task
            if @task
                @task.user_id = @user.id
                @task.save
            end
        end

        def task_params
            params.require(:user).permit(:tasks)
        end

        def project_params
            params.require(:user).permit(:tasks)
        end

        def user_params
            params.require(:user).permit(:name, :surname, :username, :password, :email, :admin)
        end
end
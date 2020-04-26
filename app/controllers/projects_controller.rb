class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_project, only: [:show, :edit, :update, :destroy]
    before_action :find_tasks, only: [:new, :edit]
    before_action :find_task, only: [:create, :update]

    def index
        @projects = current_user.projects.all
    end

    def show
    end

    def new
        @project = Project.new
    end

    def edit
    end

    def create
        @project = Project.new(project_params)
        
        if @project.save
            current_user.projects << @project
            assign_task
        else
            find_tasks
            render 'new'
        end
    end

    def update
        if @project.update(project_params)
            assign_task
        else
            find_tasks
            render 'edit'
        end
    end

    def destroy
        @project.destroy

        redirect_to projects_path, notice: "Project deleted"
    end

    private
        def find_project
            @project = current_user.projects.find(params[:id]) or record_not_found
        end

        def find_task
            begin
                @task = current_user.tasks.find(task_params[:tasks])
            rescue ActiveRecord::RecordNotFound => rnf
                @task = nil
            end
        end

        def find_tasks
            @tasks = current_user.tasks.all
        end

        def assign_task
            if @task
                @task.project_id = @project.id
                if @task.save
                    redirect_to @project
                end
            else
                redirect_to @project
            end
        end

        def project_params
            params.require(:project).permit(:name, :description)
        end

        def task_params
            params.require(:project).permit(:tasks)
        end
end
class TasksController < ApplicationController
	before_action :authenticate_user!
	before_action :find_task, only: [:show, :edit, :update, :destroy]

	def index
		@tasks = @current_user.Task.all
	end

	def new
		@task = Task.new
	end

	def create
		@task = @current_user.Task.new(task_params)

		if @task.save
			redirect_to @task
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @task.update(task_params)
			redirect_to @task
		else
			render 'edit'
		end
	end

	def destroy
		@task.destroy
		
		redirect_to tasks_path
	end

	private
		def find_task
			@task = @current_user.Task.find(params[:id]) or record_not_found
		end
		
		def task_params
			params.require(:task).permit(:name, :description, :deadline, :priority, :done)
		end
end

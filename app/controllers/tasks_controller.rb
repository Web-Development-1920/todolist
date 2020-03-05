class TasksController < ApplicationController
	def new
	end

	def create
		@task = Task.new(task_params)

		@task.save
		redirect_to @task
	end

	def show
		@task = Task.find(params[:id])
	end

	def edit
  		@task = Task.find(params[:id])
	end

	def update
  	@task = Task.find(params[:id])
 
  	if @task.update(task_params)
    	redirect_to @task
  	else
    	render 'edit'
  	end
	end

	private
		def task_params
			params.require(:task).permit(:name, :description, :deadline, :priority)
		end
end

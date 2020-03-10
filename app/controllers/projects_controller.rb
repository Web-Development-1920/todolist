class ProjectsController < ApplicationController
	before_action :find_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all
	end

	def show
	end

	def new
		@project = Project.new
		@tasks = Task.all
	end

	def edit
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to @project
		else
			# redirect_to new_project_path, :flash => {:error => @project.errors.full_messages.join(', ')}
			@tasks = Task.all
			render 'new'
		end
	end

	def update
		if @project.update(project_params)
			redirect_to @project
		else
			render 'edit'
		end
	end

	def destroy
		@project.destroy

		redirect_to projects_path
	end

	private
		def find_project
			begin
				@project = Project.find(params[:id])
			rescue StandardError => e
				render json: {
					error: e.to_s
				}
			end
		end

		def project_params
			params.require(:project).permit(:name, :description)
		end
end

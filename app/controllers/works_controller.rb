class WorksController < ApplicationController

	def index
		@works = Work.all
	end

	def show
		@work = Work.find(params[:id])
	end

	def new
		@work = Work.new
	end

	def create
		@work = Work.new(params[:work].permit(:project_id, :user_id, :datetimeperformed, :hours))
		if params[:doc]
			uploaded_io = params[:doc]
			File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), "wb") do |file|
				file.write(uploaded_io.read)
			end
		end

		if @work.save
			UsermailerMailer.workcreated_email(@work).deliver
			flash[:notice] = "Work Created"
			redirect_to @work
		else
			render 'new'
		end
	end

	def edit
		@work = Work.find(params[:id])
	end

	def update
		@work = Work.find(params[:id])
		if @work.update(params[:work].permit(:project_id, :user_id, :datetimeperformed, :hours))
			redirect_to @work
		else
			render 'edit'
		end
	end
end

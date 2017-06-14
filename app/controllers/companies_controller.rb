class CompaniesController < ApplicationController

	def index
		@companies = Company.all
	end

	def show
		@company = Company.find(params[:id])
	end

	def new
		@company = Company.new		
	end

	def create
		@company = Company.new(params[:company].permit(:name))
		if @company.save
			flash[:notice] = "Company Create"
			redirect_to @company
		else
			render 'new'
		end
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
		@company = Company.find(params[:id])
		if @company.update(params[:company].permit(:name))
			redirect_to @company
		else
			render 'edit'
		end
	end
end

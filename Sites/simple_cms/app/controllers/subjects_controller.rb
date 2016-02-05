class SubjectsController < ApplicationController
  
  layout "admin"
  
  before_action :confirm_logged_in
  
  def index
	@subjects = Subject.sorted
  end

  def show
	@subject = Subject.find(params[:id])
  end

  def new
	@subject = Subject.new({:name => "Default"})
	@subject_count = Subject.count + 1
  end
  
  def create
	#Instantiate a new object
	@subject = Subject.new(subject_params)
		if @subject.save #save the object
			flash[:notice] = "Subject Created Successfully"
			redirect_to(:action => 'index') #redirect to the index page
		else
			@subject_count = Subject.count + 1
			render('new') #if save fails, allow the user to update info
		end
  end

  def edit
	@subject = Subject.find(params[:id])
	@subject_count = Subject.count
  end
  
  def update
	@subject = Subject.find(params[:id])
		if @subject.update_attributes(subject_params)
			flash[:notice] = "Subject Updated Successfully"
			redirect_to(:action => 'show', :id=>@subject.id) #redirect to the index page
		else
			@subject_count = Subject.count
			render('edit') #if update fails, allow the user to update info
		end
  end

  def delete
	@subject = Subject.find(params[:id])
  end
  
  def destroy
	subject = Subject.find(params[:id]).destroy
	flash[:notice] = "Subject '#{subject.name}' Deleted Successfully"
	redirect_to(:action => 'index')
  end
  
  private 
	def subject_params
		params.require(:subject).permit(:name, :position, :visible, :created_at)
	end
end

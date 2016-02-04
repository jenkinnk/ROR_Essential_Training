class SubjectsController < ApplicationController
  
  layout "admin"
  
  def index
	@subjects = Subject.sorted
  end

  def show
	@subject = Subject.find(params[:id])
  end

  def new
	@subject = Subject.new({:name => "Default"})
  end
  
  def create
	#Instantiate a new object
	@subject = Subject.new(subject_params)
		if @subject.save #save the object
			flash[:notice] = "Subject Created Successfully"
			redirect_to(:action => 'index') #redirect to the index page
		else
			render('new') #if save fails, allow the user to update info
		end
  end

  def edit
	@subject = Subject.find(params[:id])
  end
  
  def update
	@subject = Subject.find(params[:id])
		if @subject.update_attributes(subject_params)
			flash[:notice] = "Subject Updated Successfully"
			redirect_to(:action => 'show', :id=>@subject.id) #redirect to the index page
		else
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
		params.require(:subject).permit(:name, :position, :visible)
	end
end

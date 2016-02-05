class PublicController < ApplicationController
  
  layout 'public'
  
  before_action :setup_navigation
  
  def index
	# introductory text shown
  end

  def show
	@page = Page.where(:permalink => params[:permalink], :visible => true).first
    if @page.nil?
      redirect_to(:action => 'index')
    else
      # display content
    end
  end
  
  private
  def setup_navigation
	@subjects = Subject.visible.sorted
  end
end

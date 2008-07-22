	class AdminController < ApplicationController
  before_filter :login_required
  access_control :index => '(admin)'
  def index
    
  end
  
  def classrooms
    render :text => "lista de turmas"
  end
end

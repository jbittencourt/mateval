class AccountController < ResourceController::Base
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  # If you want "remember me" functionality, add this before_filter to Application Controller
  #before_filter :login_from_cookie
  before_filter :login_required, :except => [:index, :login]
  access_control [:signup, :list] => '(admin)'
  
  # say something nice, you goof!  something sweet.
  def index
    redirect_to :controller => 'classrooms' if logged_in?
    #redirect_to(:controller => '/login') unless logged_in? || User.count > 0
  end
  
  def list
    @datagrid = {
      :list => User.find(:all),
      :title => "Administrar usuários",
      :header => %w(Nome Login Email),
      :fields => %w(name username email),
      :actions => %w(view edit delete),
      :action_buttons => ['add_user']
    }
  end
  def login
    return unless request.post?
    self.current_user = User.authenticate(params[:username], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        # a trick to get the user stored in the session
        User.current_user = self.current_user
        #-----------------------------------------------
        
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      
      #geting session variab
      session[:name] = self.current_user.name
      session[:user_id] = self.current_user.id
      
      redirect_back_or_default(:controller => '/classrooms', :action => 'index')
      #flash[:notice] = ""
    end
  end
  
  def signup
	 
    @user = User.new(params[:user])
  return unless request.post?
	
	#---
		r = Role.new
		r.title = "prof"
		@user.roles << r
	#---
    @user.save!
    self.current_user = @user
    flash[:notice] = "Thanks for signing up!"
    #redirect_back_or_default(:controller => '/account', :action => 'index')

  rescue ActiveRecord::RecordInvalid
  #  render :action => 'signup'
	render :layout => false
  end
  
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(:controller => '/account', :action => 'index')
  end
end

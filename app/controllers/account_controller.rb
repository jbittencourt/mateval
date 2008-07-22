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
      :list => User.paginate (:page=> params[:page], :order => 'updated_at DESC', :per_page => 2),
      :title => "Administrar usuários",
      :header => %w(Nome Login),
      :fields => %w(name username),
      :actions => %w(view_user edit_user delete_user),
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
    else
      redirect_back_or_default(:controller => '/classrooms', :action => 'index')
      
    end
  end
  
  def signup
    @user = User.new(params[:user])
	 return unless request.post?
	 y params[:prof]
	 y params[:admin]
	#---
	if params[:prof] == "1" 
		r = Role.new
	 	r = Role.find(2)
	end
	
	if params[:admin] == "1" 
		r = Role.find(1)
		@user.roles << r
	end
	#---
	@user.save!
	redirect_back_or_default(:controller => '/account', :action => 'list')
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
  
  def delete
  		user = User.find(params[:id])
  		user.destroy
  		redirect_back_or_default(:controller => '/account', :action => 'list')	
  end
  
  def edit
    @usr = User.find(params[:id])
    render :layout => false
  end
  
  def refresh
  
  	#Update user table
    usr = User.find(params[:id])
    usr.name = params[:user][:name]
    usr.username = params[:user][:username]
   # usr.password = params[:user][:password]
	# usr.password_confirmation = params[:user][:password_confirmation]
	 usr.email = params[:user][:email]
    usr.school = params[:user][:school]
    usr.city = params[:user][:city]
    usr.state = params[:user][:state]
    usr.save!
    
    #refresh admin
	admin = Role.find(1)
	prof = Role.find(2)
	
   if (params[:admin] == "1") and not usr.roles.include?(admin)
			usr.roles << admin

	else
		if  (params[:admin] == nil) and usr.roles.include?(admin)
			usr.roles.delete(admin) 
		end
	end	

	#refresh prof
	 if (params[:prof] == "1") and not usr.roles.include?(prof)
			usr.roles << prof
	else
		if  (params[:prof] == nil) and usr.roles.include?(prof)
			usr.roles.delete(prof)
		end
	end	

			    
    redirect_to :controller => 'account', :action => 'list'

  end
  
  def show
	@usr = User.find(params[:id])
	render :layout => false

  end
end

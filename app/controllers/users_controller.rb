class UsersController < ApplicationController

  # render new.rhtml

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  def show
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to(user_url(@user))
    else
      render :action => "edit"
    end
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    @user.build_address #Gags added
    @user.albums.build({:name => "Default Album"})
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
end

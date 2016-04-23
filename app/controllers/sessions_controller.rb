class SessionsController < ApplicationController
  before_filter :authenticate_user, :only => [:home, :profile, :setting]
	before_filter :save_login_state, :only => [:login, :login_attempt]
  
  def login
  end
  
  #To handle with users' login attempts
  def login_attempt
  	authorized_user = User.authenticate(params[:email], params[:login_password])
      if authorized_user&&authorized_user.level==1
       session[:user_id] = authorized_user.id  
       flash[:notice]="Welcome again, you logged in as #{authorized_user.email}"
       redirect_to '/home'
       return
      elsif authorized_user&&authorized_user.level==0
       session[:user_id] = authorized_user.id  
       flash[:notice]="Welcome home, Administrator #{authorized_user.email}"
       redirect_to '/admin'
       return
    else
    	flash[:notice]="Invalid Username or Password"
    	flash[:color]="Invalid"
    	redirect_to '/login'
      return
    end
  end
 
  def home
    id = session[:user_id]
    @user = User.find(id)
    if @user.level == 1
      @vehicles=Vehicle.where(user_id: id).all
      @registeredevents =''
      @registeredeid = Answer.where(uid: id).all.uniq.pluck(:eid)
      if (@registeredeid.length !=0)
        @registeredevents = Event.find(@registeredeid)
      end
      @impressions = Impression.where(uid: id).all
    else 
      if @user.level ==0
       redirect_to '/admin'
      end
    end
  end


  def profile
    id = session[:user_id]
    @users = User.find(id)
  end

  def create
    @user = User.new
    @flash_notice = ""
    if params[:commit] != nil && params[:commit] == 'Create'
        @user.email = params[:email]
        @user.password = params[:password]
        @user.lastname = params[:lastname]
        @user.firstname = params[:firstname]
        @user.phonenumber = params[:phonenumber]
        @user.gender = params[:gender]
        @user.level=1
        @user.zipcode=params[:zipcode]
        if ZIP_CODE.find(params[:zipcode]) == nil
          @user.zipcode = nil
          flash[:notice] = "Zip Code Error"
          render 'create'
          return
        end
        if @user.valid?
          if @user.save
            session[:user_id] = @user.id
            @flash_notice = "Sign Up Successfully!"
            # UserNotifier.send_signup_email(@user).deliver_later
            redirect_to '/home'
            return
          else
            @user.password = nil
            @flash_notice += "DB Error"
            render 'create'
            return
          end
        else
          
          @user.password = nil
          @flash_notice += "Sign Up Error"
          render 'create'
          return
        end
      end
    end

  def setting
    id = @current_user.id
    @flash_notice = ""
    if params[:commit] != nil && params[:commit] == 'Save'
      @current_user.email = params[:email]
      @current_user.password = params[:password]
      @current_user.lastname = params[:lastname]
      @current_user.firstname = params[:firstname]
      @current_user.phonenumber = params[:phonenumber]
      @current_user.gender = params[:gender]
      @current_user.zipcode = params[:zipcode]
      if ZIP_CODE.find(params[:zipcode]) == nil
        @current_user.zipcode = nil
        @flash_notice = "Zip Code Error"
        render 'setting'
        return
      end
      if @current_user.valid?
        if @current_user.save
          flash[:notice] = "Information Updated"
          redirect_to '/profile'
          return
        else
          @flash_notice = "Edit Error"
        end
      else
          @current_user.password = nil
          @flash_notice += "Sign Up Error"
          render 'setting'
          return
        end
    end
  end


  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    id = session[:user_id]
    @current_user = User.find(id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :lastname, :firstname, :phonenumber, :gender, :role)
  end


end

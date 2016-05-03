class VehiclesController < ApplicationController
  before_filter :authenticate_user, :only => [:create, :show]
  
  def isuser
    	vid = params[:vid]
      @vehicle = Vehicle.find(vid)
    	if(@vehicle.user_id!=session[:user_id])
	    	flash[:notice]="You are not authorized to view that page"
	    	# flash[:color]="Invalid"
	    	redirect_to '/login'
    	end
	end
  
  def create
    @vehicle=Vehicle.new
    @flash_notice = ""
    id = session[:user_id]
    @user = User.find(id)
        
    if params[:commit] != nil && params[:commit] == 'Create'
      @vehicle.vname = params[:Name]
      @vehicle.vclass = params[:Class]
      @vehicle.vnation = params[:Nation]
      @vehicle.vwar = params[:War]
      @vehicle.vdescription = params[:Description]
      @vehicle.user_id = session[:user_id]
      if @vehicle.valid?
        if @vehicle.save
          session[:vid] = @vehicle.id
          flash[:notice] = "Vehicle Created Successfully!"
          vid = @vehicle.id
          @user.increment!(:uvehicleflag, 1)
          redirect_to "/vehicleshow?vid=#{vid}"
        else
          @flash_notice += "DB Error"
          render 'create'
        end
      else
      @flash_notice += "Create Error"
      render 'create'
      end
    end
  end 
    
  def show
    self.isuser
    vid = params[:vid]
    @vehicle = Vehicle.find(vid)
  end
    
  def save
    self.isuser
    vid = params[:vid]
    @vehicle = Vehicle.find(vid)
  end 
    
  def edit
    self.isuser
    vid = params[:vid]
    @vehicle = Vehicle.find(vid)
    @flash_notice = ""
  end 
    
  def update
    self.isuser
    vid = params[:vid]
    @vehicle = Vehicle.find(vid)
        
    if params[:commit] != nil && params[:commit] == 'Save'
      @vehicle.vname = params[:Name]
      @vehicle.vclass = params[:Class]
      @vehicle.vnation = params[:Nation]
      @vehicle.vwar = params[:War]
      @vehicle.vdescription = params[:Description]
      if @vehicle.valid?
        if @vehicle.save
          session[:vid] = @vehicle.id
          flash[:notice] = "Vehicle Edited Successfully!"
          vid = @vehicle.id
          redirect_to "/vehicleupdate?vid=#{vid}"
        else
          @flash_notice += "DB Error"
          render 'edit'
        end
      else
        @flash_notice += "Save Error"
        render 'edit'
      end
    end
  end 
    
  def delete

    id = session[:user_id]
    @user = User.find(id)
    

    self.isuser

  	vid = params[:vid]
  	@user.decrement!(:uvehicleflag, 1)
  	Vehicle.find(vid).destroy
  	redirect_to '/homev'
  end
  
end
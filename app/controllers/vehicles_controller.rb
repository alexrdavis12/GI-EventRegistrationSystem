class VehiclesController < ApplicationController
    
  def create
    @vehicle=Vehicle.new
    @flash_notice = ""
        
    if params[:commit] != nil && params[:commit] == 'Create'
      @vehicle.vname = params[:Name]
      @vehicle.vclass = params[:Class]
      @vehicle.vnation = params[:Nation]
      @vehicle.vwar = params[:War]
      @vehicle.vdescription = params[:Description]
      if @vehicle.valid?
        if @vehicle.save
          session[:vid] = @vehicle.id
          flash[:notice] = "Vehicle Created Successfully!"
          vid = @vehicle.id
          redirect_to "/vehicleshow?vid=#{vid}"
        else
          @flash_notice += "DB Error"
          render 'create'
        end
      else
      @flash_notice += "Create Error"
      render 'create'
      end
    else
      @flash_notice += "params error"
      render 'create'
    end
  end 
    
  def show
    vid = params[:vid]
    @vehicle = Vehicle.find(vid)
  end
    
  def save
    vid = params[:vid]
    @vehicle = Vehicle.find(vid)
  end 
    
  def edit
    vid = params[:vid]
    @vehicle = Vehicle.find(vid)
    @flash_notice = ""
  end 
    
  def update
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
    
    
end
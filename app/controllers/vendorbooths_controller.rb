class VendorboothsController < ApplicationController
  before_filter :authenticate_user, :only => [:create]
  
  def create
    @vendorbooth=Vendorbooth.new
    @flash_notice = ""
        
    if params[:commit] != nil && params[:commit] == 'Create'
      @vendorbooth.vbname = params[:Name]
      @vendorbooth.vbdescription = params[:Description]
      @vendorbooth.uid = session[:user_id]
      if @vendorbooth.valid?
        if @vendorbooth.save
          session[:vbid] = @vendorbooth.id
          flash[:notice] = "Vendorbooth Created Successfully!"
          vbid = @vendorbooth.id
          redirect_to "/vendorboothshow?vbid=#{vbid}"
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
    vbid = params[:vbid]
    @vendorbooth = Vendorbooth.find(vbid)
  end
    
  def save
    vbid = params[:vbid]
    @vendorbooth = Vendorbooth.find(vbid)
  end 
    
  def edit
    vbid = params[:vbid]
    @vendorbooth = Vendorbooth.find(vbid)
    @flash_notice = ""
  end 
    
  def update
    vbid = params[:vbid]
    @vendorbooth = Vendorbooth.find(vbid)
        
    if params[:commit] != nil && params[:commit] == 'Save'
      @vendorbooth.vbname = params[:Name]
      @vendorbooth.vbdescription = params[:Description]
      if @vendorbooth.valid?
        if @vendorbooth.save
          session[:vbid] = @vendorbooth.id
          flash[:notice] = "Vendorbooth Edited Successfully!"
          vbid = @vendorbooth.id
          redirect_to "/vendorboothupdate?vbid=#{vbid}"
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
  	vbid = params[:vbid]
  	Vendorbooth.find(vbid).destroy
  	redirect_to '/home'
  end
  
end
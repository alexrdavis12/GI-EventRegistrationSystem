class VendorboothsController < ApplicationController
  before_filter :authenticate_user, :only => [:create]

  def isuser
    	vbid = params[:vbid]
      @vendorbooth = Vendorbooth.find(vbid)
    	if(@vendorbooth.uid!=session[:user_id])
	    	flash[:notice]="You are not authorized to view that page"
	    	# flash[:color]="Invalid"
	    	redirect_to '/login'
    	end
	end

  
  def create
    @vendorbooth=Vendorbooth.new
    @flash_notice = ""
        
    if params[:commit] != nil && params[:commit] == 'Create'
      @vendorbooth.vbname = params[:Name]
      @vendorbooth.vbdescription = params[:Description]
      @vendorbooth.vbspaces = params[:spaces]
      @vendorbooth.uid = session[:user_id]
      if @vendorbooth.valid?
        if @vendorbooth.save
          session[:vbid] = @vendorbooth.id
          flash[:notice] = "Vendor Booth Created Successfully!"
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
    end
  end 
    
  def show
    self.isuser
    vbid = params[:vbid]
    @vendorbooth = Vendorbooth.find(vbid)
  end
    
  def save
    self.isuser
    vbid = params[:vbid]
    @vendorbooth = Vendorbooth.find(vbid)
  end 
    
  def edit
    self.isuser
    vbid = params[:vbid]
    @vendorbooth = Vendorbooth.find(vbid)
    @flash_notice = ""
  end 
    
  def update
    self.isuser
    vbid = params[:vbid]
    @vendorbooth = Vendorbooth.find(vbid)
        
    if params[:commit] != nil && params[:commit] == 'Save'
      @vendorbooth.vbname = params[:Name]
      @vendorbooth.vbdescription = params[:Description]
      @vendorbooth.vbspaces = params[:spaces]
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
    self.isuser
  	vbid = params[:vbid]
  	if(	Vendorbooth.find(vbid))
    	Vendorbooth.find(vbid).destroy
    end
  	redirect_to '/homevb'
  end
  
end
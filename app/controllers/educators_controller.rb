class EducatorsController < ApplicationController
  before_filter :authenticate_user, :only => [:create]

  def isuser
    	edid = params[:edid]
      @educator = Educator.find(edid)
    	if(@educator.uid!=session[:user_id])
	    	flash[:notice]="You are not authorized to view that page"
	    	# flash[:color]="Invalid"
	    	redirect_to '/login'
    	end
	end

  
  def create
    @educator=Educator.new
    @flash_notice = ""
        
    if params[:commit] != nil && params[:commit] == 'Create'
      @educator.edschooltype = params[:Type]
      @educator.uid = session[:user_id]
      @educator.edaddress = params[:Address]
      @educator.edzip = params[:Zip]
      @educator.edprimaryemail = params[:PrimaryEmail]
      @educator.edprimaryname = params[:PrimaryName]
      @educator.edprimaryphone = params[:PrimaryPhone]
          
      if(params[:Type] == 'Home School')
        @educator.edpgaurdianname = params[:GuardianName]
        @educator.edpgaurdianphone = params[:GuardianPhone]
        @educator.edgaurdianemail = params[:GuardianEmail]
      else
        @educator.edschoolname = params[:SchoolName]
        @educator.edprimaryrole = params[:PrimaryRole]
        @educator.edprinciplename = params[:PrincipleName]
        @educator.edprincipleemail = params[:PrincipleEmail]
      end
      
      if ZIP_CODE.find(params[:Zip]) == nil
        @educator.edzip = nil
        @flash_notice = "Invalid Zip Code"
      end
      
      if @educator.valid? && @flash_notice == ""
        if @educator.save
          session[:edid] = @educator.id
          flash[:notice] = "Educator Created Successfully!"
          edid = @educator.id
          redirect_to "/educatorshow?edid=#{edid}"
        else
          @flash_notice += "DB Error"
          render 'create'
        end
      else
        @flash_notice = "Create Error: " + @flash_notice
        render 'create'
      end
    end
  end 
    
  def show
    self.isuser
    edid = params[:edid]
    @educator = Educator.find(edid)
  end
    
  def save
    self.isuser
    edid = params[:edid]
    @educator = Educator.find(edid)
  end 
    
  def edit
    self.isuser
    edid = params[:edid]
    @educator = Educator.find(edid)
    @flash_notice = ""
  end 
    
  def update
    self.isuser
    edid = params[:edid]
    @educator = Educator.find(edid)
        
    if params[:commit] != nil && params[:commit] == 'Save'
      @educator.edschooltype = params[:Type]
      @educator.uid = session[:user_id]
      @educator.edaddress = params[:Address]
      @educator.edzip = params[:Zip]
      @educator.edprimaryemail = params[:PrimaryEmail]
      @educator.edprimaryname = params[:PrimaryName]
      @educator.edprimaryphone = params[:PrimaryPhone]
          
      if( @educator.edschooltype == 'Home School')
        @educator.edpgaurdianname = params[:GuardianName]
        @educator.edpgaurdianphone = params[:GuardianPhone]
        @educator.edgaurdianemail = params[:GuardianEmail]
      else
        @educator.edschoolname = params[:SchoolName]
        @educator.edprimaryrole = params[:PrimaryRole]
        @educator.edprinciplename = params[:PrincipleName]
        @educator.edprincipleemail = params[:PrincipleEmail]
      end
       
      if ZIP_CODE.find(params[:Zip]) == nil
        @educator.edzip = nil
        @flash_notice = "Invalid Zip Code"
      end
      
      
      if @educator.valid? && @flash_notice == ""
        if @educator.save
          session[:edid] = @educator.id
          flash[:notice] = "Educator Edited Successfully!"
          edid = @educator.id
          redirect_to "/educatorupdate?edid=#{edid}"
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
  	edid = params[:edid]
  	Educator.find(edid).destroy
  	redirect_to '/homeed'
  end
  
end
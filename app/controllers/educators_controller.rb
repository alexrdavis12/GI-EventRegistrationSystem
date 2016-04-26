class EducatorsController < ApplicationController
  before_filter :authenticate_user, :only => [:create]
  
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
      
      if @educator.valid?
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
      @flash_notice += "Create Error"
      render 'create'
      end
    else
      @flash_notice += "params error"
      render 'create'
    end
  end 
    
  def show
    edid = params[:edid]
    @educator = Educator.find(edid)
  end
    
  def save
    edid = params[:edid]
    @educator = Educator.find(edid)
  end 
    
  def edit
    edid = params[:edid]
    @educator = Educator.find(edid)
    @flash_notice = ""
  end 
    
  def update
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
      
      if @educator.valid?
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
  	edid = params[:edid]
  	Educator.find(edid).destroy
  	redirect_to '/home'
  end
  
end
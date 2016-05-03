class EventsController < ApplicationController

	def isadmin
		  id = session[:user_id]
    	@users = User.find(id)
    	if(@users.level!=0)
	    	flash[:notice]="You are not authorized to that page"
	    	flash[:color]="Invalid"
	    	redirect_to '/login'
    	end
	end

	def create
	  self.isadmin
		@event = Event.new
		@flash_notice = ""

		if params[:commit] != nil && params[:commit] == 'Create'
			    @event.etitle = params[:Title]
         	@event.elocation = params[:Location]
         	@event.estart = params[:Start_Date]
          	@event.eend = params[:End_Date]
          	@event.edescription = params[:Description]
          	if @event.valid?
          		if @event.save
          			session[:eid] = @event.id
          			flash[:notice] = "Event Created Successfully!"
                eid=@event.id
          			redirect_to "/eventshow?eid=#{eid}"
          		else
          			@flash_notice += "DB Error"
          			render 'create'
          		end

            else
          		@flash_notice += "Create Error"
          		render 'Create'
          	end
    end
  end
    
  def show
    eid=params[:eid]
  	@event = Event.find(eid)
  end
  
  def save
    eid=params[:eid]
  	@event = Event.find(eid)
  end
  
  def edit
    self.isadmin
    eid = params[:eid]
    @event = Event.find(eid)
    @flash_notice = ""
  end
  
  def update
    self.isadmin
    eid = params[:eid]
    @event = Event.find(eid)
    if params[:commit] != nil && params[:commit] == 'Save'
		    @event.etitle = params[:Title]
       	@event.elocation = params[:Location]
       	@event.estart = params[:Start_Date]
      	@event.eend = params[:End_Date]
      	@event.edescription = params[:Description]
      	if @event.valid?
      		if @event.save
      	  	session[:eid] = @event.id
      	  	flash[:notice] = "Event Edited Successfully!"
            eid=@event.id
      	  	redirect_to "/eventupdate?eid=#{eid}"
      		else
      			@flash_notice += "DB Error"
      			redirect_to "/eventedit?eid=#{eid}"
      		end
      	else
      		@flash_notice += "Save Error"
      		redirect_to "/eventedit?eid=#{eid}"
      	end
    end
  end
  
  def allevent
    id = session[:user_id]
    @user = User.find(id)
    
    if(@user.uvendorflag > 0)
      @vendorevents = Event.where(evendorflag => 1).all
    
    elsif(@user.uvehicleflag > 0)
      @vehicleevents = Event.where(evehicleflag => 1).all
    
    elsif(@user.uimpressionflag > 0)
      @impressionevents = Event.where(eimpressionflag => 1).all
      
    elsif(@user.ueducatorflag > 0)
      @educatorevents = Event.where(eeducatorflag => 1).all
    end
    
    @curlevel = User.find(id).level
    if(@curlevel != 0)
      @event = @vendorevents
      @event << @vehicleevents
      @event << @impressionevents
      @event << @educatorevents
    else
      redirect_to '/admin'
    end
  end
    
  
end

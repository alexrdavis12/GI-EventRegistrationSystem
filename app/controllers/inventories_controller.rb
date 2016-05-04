class InventoriesController < ApplicationController
  before_filter :authenticate_user, :only => [:create]
   
  #this function should get all the data needed to populate the show page so that the user can select what they are taking to an event
  def usersstuff
    
    id = session[:user_id]
    #Get the eid to be used for pulling up users data
    if params[:eid] != nil 
      @eid = params[:eid]
      @event = Event.find(@eid)
      
      if(Answer.where(uid: id,eid: params[:eid]).all.length != 0)
  			flash[:notice] = "You have already registered for this event!"
  			redirect_to '/allevent'
  			return
		  end
      
      #@flash_notice = ""
      
      #this event is for impressionists
      if @event.eimpressionflag == 1
        @userimpressions = Impression.where(uid: id).all   
      end   
      #this event is for vehicles
      if @event.evehicleflag == 1
         @uservehicles = Vehicle.where(user_id: id).all
      end 
      #this event is for vendors    
      if @event.evendorflag == 1
        @uservendorbooths = Vendorbooth.where(uid: id).all
      end 
      #this event is for educators
      if @event.eeducatorflag == 1
        @usereducators = Educator.where(uid: id).all
      end
      render 'create'
    else
      @flash_notice = "Event ID is not specified!"
      @error_type = -1
      render 'create'
      return
    end
  end
   
   
  def create
    #Get the id of the current user
    id = session[:user_id]
    @current_user = User.find(id)
    @inventory = Inventorie.new
    
    
    if params[:commit] != nil && params[:commit] == 'Create'
      @inventory.eid = params[:eid]
      @inventory.uid = session[:user_id]
      
      #insert the checks for whether or not the items are selected and add them to the inventory object
      vids = ""
      edids =""
      iids = ""
      vbids =""
      
      #get all the ids of the items that were selected
      puts "testing"
      params.each do |key, value|
        if key.include? "vehicle"
           vids << '_' << value
        end
        if key.include? "educators"
          edids << '_' << value
        end
        if key.include? "impression"
          iids << '_' << value
        end
        if key.include? "vendorbooth"
          vbids << '_' << value
        end
      end
      
      #save the resulting string of ids to the db
      
      @inventory.inventvid = vids
      @inventory.inventedid = edids
      @inventory.inventvbid = vbids
      @inventory.inventviid = iids
      
      if @inventory.valid?
        if @inventory.save
          flash[:notice] = "Infomation Submitted Successfully!"
          #maybe do stuff here
          eid = @inventory.eid
          redirect_to "/eventsurvey?eid=#{eid}"
        else
          @flash_notice += "DB Error"
          render 'create'
        end
      else
        @flash_notice += "Submissions Error"
        render 'create'
      end
    end
  end
end
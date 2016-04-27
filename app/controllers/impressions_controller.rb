class ImpressionsController < ApplicationController
  before_filter :authenticate_user, :only => [:create]
  
  def create
    @impression=Impression.new
    @flash_notice = ""
        
    if params[:commit] != nil && params[:commit] == 'Create'
      @impression.iname = params[:Name]
      @impression.iside = params[:Side]
      @impression.iwar = params[:War]
      @impression.commander = params[:Commander]
      @impression.idescription = params[:Description]
      @impression.unitid = params[:Unit]
      @impression.uid = session[:user_id]
      #fill in the value for commander id after completing units
      if @impression.valid?
        if @impression.save
          session[:iid] = @impression.id
          flash[:notice] = "Impression Created Successfully!"
          iid = @impression.id
          redirect_to "/impressionshow?iid=#{iid}"
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
    iid = params[:iid]
    @impression = Impression.find(iid)
  end
    
  def save
    iid = params[:iid]
    @impression = Impression.find(iid)
  end 
    
  def edit
    iid = params[:iid]
    @impression = Impression.find(iid)
    @flash_notice = ""
  end 
    
  def update
    iid = params[:iid]
    @impression = Impression.find(iid)
        
    if params[:commit] != nil && params[:commit] == 'Save'
      @impression.iname = params[:Name]
      @impression.iside = params[:Side]
      @impression.iwar = params[:War]
      @impression.unitid = params[:Unit]
      @impression.commander = params[:Commander]
      @impression.idescription = params[:Description]
      if @impression.valid?
        if @impression.save
          session[:iid] = @impression.id
          flash[:notice] = "Impression Edited Successfully!"
          iid = @impression.id
          redirect_to "/impressionupdate?iid=#{iid}"
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
  	iid = params[:iid]
  	Impression.find(iid).destroy
  	redirect_to '/home'
  end
  
end
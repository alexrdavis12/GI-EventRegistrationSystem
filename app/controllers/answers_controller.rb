class AnswersController < ApplicationController
	before_filter :authenticate_user, :only => [:create]

	def isadmin
		id = session[:user_id]
		@users = User.find(id)
		if(@users.level!=0)
			flash[:notice]="You are not authorized to that page"
			flash[:color]="Invalid"
			redirect_to '/login'
		end
	end
	
	def index
		self.isadmin
		eid = params[:eid]
		@eid = params[:eid]
		@answers = Answer.where(eid: eid)
		@answers.seteid(eid)
		respond_to do |format|
			format.html
			format.csv { send_data @answers.to_csv }
    	end
	end

	def create
		# show questions
		if params[:eid] != nil
			@eid = params[:eid]
		else
			# handle exceptions
		end
			
		@q = Question.where(:eid => @eid).all
			
		if params[:commit] != nil && params[:commit] == 'Submit'
			params.each do |key, value|
				if ("#{key}".index('S') != nil)
					prefix_str = "#{key}".delete "S"
					split_prefrix_str = prefix_str.split('_')
					parent_id = split_prefrix_str[0].to_i 
					parent_optid = split_prefrix_str[1].to_i
					subqcnt = split_prefrix_str[2].to_i * 1000
					qid = parent_id * 1000000 + parent_optid + subqcnt
					@answer = Answer.new
					@answer.uid = session[:user_id]
					@answer.qid = qid
					@answer.qtitle = Question.where(eid: params[:q_eid], qid:qid).select(:qtitle).take[:qtitle]
					@answer.eid = params[:q_eid]
					@answer.answer = value[:answer]
					if @answer.valid?
						if @answer.save          			
						else
							@flash_notice += "DB Error"
							render 'create'
						end
					else   			
						@flash_notice += "Create Error"
						render 'create'
					end
				elsif ("#{key}".index('Q') != nil)
					strqid = "#{key}".delete "Q"
					qid = strqid.to_i
					@answer = Answer.new
					@answer.uid = session[:user_id]
					@answer.qid = qid
					@answer.qtitle = Question.where(eid: params[:q_eid], qid:qid).select(:qtitle).take[:qtitle]
					@answer.eid = params[:q_eid]
					@answer.answer = value[:answer]
					if @answer.valid?
						if @answer.save          			
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
			redirect_to '/home'
		end
	end

	def show
		#@answer = Answer.all
	end

	def showquestion    
		currentuid=session[:user_id]
		if(Answer.where(uid: currentuid,eid: params[:eid]).all.length != 0)
			flash[:notice] = "You have already registered for this event!"
			redirect_to '/allevent'
		end
		
		# show questions
		if params[:eid] != nil
			@eid = params[:eid]
		else
			# handle exceptions
		end
		
		@q = Question.where(:eid => @eid).all
		return
	end
         	
end

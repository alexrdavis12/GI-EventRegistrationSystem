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
				puts params.inspect
				if ("#{key}".index('S') != nil)			#dont think we need to distinguish subquestions
					prefix_str = "#{key}".delete "Q"  #these are subquestions
					
					@answer = Answer.new
					@answer.uid = session[:user_id]
					@answer.qid = qid
					@answer.qtitle = Question.where(eid: params[:q_eid], qid:qid).select(:qtitle).take[:qtitle]
					# checked_options = nil
					# options = Question.where(eid: params[:q_eid], qid:qid).select(:qoption).take[:qoption]
					# type = Question.where(eid: params[:q_eid], qid:qid).select(:qtype).take[:qtype]
					# optionlist = options.split('|')
					# first = true
					# if (optionlist != nil) 
					# 	optionlist.each do |op|
					# 		if (params["#{op}"].is(:checked))
					# 			if (first)
					# 				checked_options.concat("" + op)
					# 				first = false
					# 			else
					# 				checked_options.concat("|" + op)
					# 			end
					# 		end
					# 	end
					# end
					@answer.eid = params[:q_eid]
					# if (type == "2")
					# 	@answer.answer = checked_options
					# else
					@answer.answer = value[:answer]
					# end
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
					
					# checked_options = nil
					# options = Question.where(eid: params[:q_eid], qid:qid).select(:qoption).take[:qoption]
					# type = Question.where(eid: params[:q_eid], qid:qid).select(:qtype).take[:qtype]
					# optionlist = options.split('|')
					# first = true
					# if (optionlist != nil) 
					# 	optionlist.each do |op|
					# 		if (params["#{op}"].is(:checked))
					# 			if (first)
					# 				checked_options += op
					# 				first = false
					# 			else
					# 				checked_options += ("|" + op)
					# 			end
					# 		end
					# 	end
					# end
					@answer.eid = params[:q_eid]
					# if (type =="2")
					# 	@answer.answer = checked_options
					# else
					@answer.answer = value[:answer]
					# end
					
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

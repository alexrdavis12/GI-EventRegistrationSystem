class QuestionsController < ApplicationController

	def isadmin
		id = session[:user_id]
    	@users = User.find(id)
    	if(@users.level!=0)
	    	flash[:notice]="You are not authorized to that page"
	    	flash[:color]="Invalid"
	    	redirect_to '/login'
    	end
		@events=Event.all
	end


	def create
		self.isadmin
		@flash_notice = ''
		@error_type = 0

		if params[:eid] != nil
			@eid = params[:eid]
		elsif params[:commit] == nil || params[:commit] != 'Create'
			@flash_notice = "Event ID is not specified!"
			@error_type = -1
			render 'create'
			return
		end

		qarray = []

		if params[:commit] != nil && params[:commit] == 'Create'
			params.each do |key, value|
				
				if ("#{key}".index('S') != nil)
					@question = Question.new
					prefix_str = "#{key}".delete "S"
					split_prefrix_str = prefix_str.split('_')
					parent_id = split_prefrix_str[0].to_i 
					parent_optid = split_prefrix_str[1].to_i
					subqcnt = split_prefrix_str[2].to_i * 1000

					qid = parent_id * 1000000 + parent_optid + subqcnt
					@question.qid = qid
					@question.eid = params[:q_eid]
					@question.parentopt = parent_optid
					if (@question.eid == nil)
	      	  			@flash_notice = "Illegal Arguments"
	      	  				redirect_to "/QuestionCreate?eid=#{params[:q_eid]}"
	      	  			return
	      	  		end

	      	  		@question.qparentid = parent_id
	      	  		@question.eid = params[:q_eid]
	      	  		@question.qtitle = value[:title]
	          		if (@question.qtitle == nil or @question.qtitle == "")
	      	  			@flash_notice = "Empty title is not allowed"
	      	  			redirect_to "/QuestionCreate?eid=#{params[:q_eid]}"
	      	  			return
	      	  		end

	          		@question.qtype = value[:type]
	          		if (@question.qtype == nil or @question.qtype == "" or !["1", "2", "3", "4", "5"].include?@question.qtype)
	      	  			@flash_notice = "Illegal Type"
	      	  			redirect_to "/QuestionCreate?eid=#{params[:q_eid]}"
	      	  			return
	      	  		end

	          		option_str = ""
	          		value.each do |k, v|
	          			if ("#{k}".index('opt') != nil) 
	          				option_str += v + "|"
	          			end
	          		end

	          		@question.qoption = option_str[0...-1]

	          		if @question.valid?
	          			qarray << @question
	          		else
	          			@flash_notice = "Create Error"
	          			redirect_to "/QuestionCreate?eid=#{params[:q_eid]}"
	          			return
	          		end
	      	  		
				end

				if ("#{key}".index('Q') != nil)
					@question = Question.new
					strqid = "#{key}".delete "Q"
					qid = strqid.to_i
					puts "qid=#{qid}"
					@question.qid = qid
	      	  		@question.eid = params[:q_eid]

	      	  		if (@question.eid == nil)
	      	  			@flash_notice = "Illegal Arguments no eid"
	      	  			redirect_to "/QuestionCreate?eid=#{params[:q_eid]}"
	      	  			return
	      	  		end
	          		@question.qtitle = value[:title]
	          		if (@question.qtitle == nil or @question.qtitle == "")
	      	  			@flash_notice = "Empty title is not allowed"
	      	  		#	render 'create', eid: @question.eid
	      	  			redirect_to "/QuestionCreate?eid=#{params[:q_eid]}"
	      	  			return
	      	  		end
	          		@question.qtype = value[:type]
	          		if (@question.qtype == nil or @question.qtype == "" or !["1", "2", "3", "4", "5"].include?@question.qtype)
	      	  			@flash_notice = "Illegal Type"
	      	  			redirect_to "/QuestionCreate?eid=#{params[:q_eid]}"
	      	  			return
	      	  		end

	          		option_str = ""
	          		value.each do |k, v|
	          			if ("#{k}".index('opt') != nil) 
	          				option_str += v + "|"
	          			end
	          		end
	          		@question.qoption = option_str[0...-1]

	          		if @question.valid?
	          			qarray << @question
	          		else
	          			@flash_notice = "Create Error"
	          			redirect_to "/QuestionCreate?eid=#{params[:q_eid]}"
	          			return
	          		end
	          	end
	        end

	        qarray.each do |question|
	        	question.save
	        end
	          
	        cureid = params[:q_eid]
	        redirect_to "/questionshow?eid=#{cureid}"	    	
	        return
	    end

	end

	def save
        eid=params[:eid]
        qid=params[:qid]
  	    @question = Question.where(eid: eid).find(qid)
    end
	
	def show
        eid = params[:eid]
        @questions = Question.where(eid: eid )
	end
	
	def edit
		@flash_notice = ""
        eid = params[:eid]
        @eid = eid
        @questions = Question.where(eid: eid )
	end
	
	def update

	eid = params[:eid]
	@questionsold = Question.where(eid: eid )
    @questions = Question.where(eid: eid )

		if params[:eid] != nil
			@eid = params[:eid]
		elsif params[:commit] == nil || params[:commit] != 'Save'
			flash[:notice] = "Event ID is not specified!"
			@error_type = -1
			redirect_to "/QuestionEdit?eid=#{eid}"
			return
		end

		qarray = []
		
		if params[:commit] != nil && params[:commit] == 'Save'
			params.each do |key, value|
				
				if ("#{key}".index('S') != nil)
					@question = Question.new
					prefix_str = "#{key}".delete "S"
					split_prefrix_str = prefix_str.split('_')
					parent_id = split_prefrix_str[0].to_i 
					parent_optid = split_prefrix_str[1].to_i
					subqcnt = split_prefrix_str[2].to_i * 1000

					qid = parent_id * 1000000 + parent_optid + subqcnt
					@question.qid = qid
					@question.eid = params[:q_eid]
					@question.parentopt = parent_optid
					eid = params[:q_eid]
					if (@question.eid == nil)
	      	  			@flash_notice = "Illegal Arguments"
	      	  			redirect_to "/QuestionEdit?eid=#{eid}"
	      	  			return
	      	  		end

	      	  		@question.qparentid = parent_id
	      	  		@question.eid = params[:q_eid]
	      	  		@question.qtitle = value[:title]
	          		if (@question.qtitle == nil or @question.qtitle == "")
	      	  			@flash_notice = "Empty title is not allowed"
	      	  			redirect_to "/QuestionEdit?eid=#{eid}"
	      	  			return
	      	  		end

	          		@question.qtype = value[:type]
	          		if (@question.qtype == nil or @question.qtype == "" or !["1", "2", "3", "4", "5"].include?@question.qtype)
	      	  			@flash_notice = "Illegal Type"
	      	  			redirect_to "/QuestionEdit?eid=#{eid}"
	      	  			return
	      	  		end

	          		option_str = ""
	          		value.each do |k, v|
	          			if ("#{k}".index('opt') != nil) 
	          				option_str += v + "|"
	          			end
	          		end

	          		@question.qoption = option_str[0...-1]

	          		if @question.valid?
	          			@questions << @question
	          		else
	          			@flash_notice = "Edit Error"
	          			redirect_to "/QuestionEdit?eid=#{eid}"
	          			return
	          		end
	      	  		
				end

				if ("#{key}".index('Q') != nil)
					@question = Question.new
					strqid = "#{key}".delete "Q"
					qid = strqid.to_i
					puts "qid=#{qid}"
					@question.qid = qid
	      	  		@question.eid = params[:q_eid]

	      	  		if (@question.eid == nil)
	      	  			@flash_notice = "Illegal Arguments no eid"
	      	  			redirect_to "/QuestionEdit?eid=#{eid}"
	      	  			return
	      	  		end
	          		@question.qtitle = value[:title]
	          		if (@question.qtitle == nil or @question.qtitle == "")
	      	  			@flash_notice = "Empty title is not allowed"
	      	  			redirect_to "/QuestionEdit?eid=#{eid}"
	      	  			return
	      	  		end
	          		@question.qtype = value[:type]
	          		if (@question.qtype == nil or @question.qtype == "" or !["1", "2", "3", "4", "5"].include?@question.qtype)
	      	  			@flash_notice = "Illegal Type"
	      	  			redirect_to "/QuestionEdit?eid=#{eid}"
	      	  			return
	      	  		end

	          		option_str = ""
	          		value.each do |k, v|
	          			if ("#{k}".index('opt') != nil) 
	          				option_str += v + "|"
	          			end
	          		end
	          		@question.qoption = option_str[0...-1]

	          		if @question.valid?
	          			@questions << @question
	          		else
	          			@flash_notice = "Edit Error"
	          			redirect_to "/QuestionEdit?eid=#{eid}"
	          			return
	          		end
	          	end
	        end

			@questionsold.each do |q|
				if q.valid?
					q.delete
				end
			end	
	        @questions.each do |question|
	        	question.save
	        end
	          
	        cureid = params[:q_eid]
	        redirect_to "/questionupdate?eid=#{cureid}"	    	
	        return
	    end

	end

end
	

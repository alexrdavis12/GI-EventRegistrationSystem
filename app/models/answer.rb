class Answer < ActiveRecord::Base
	def self.seteid(eid)
		@eid = eid
	end
	
	def self.to_csv
    CSV.generate do |csv|
      column_names_for_event = ["etitle", "elocation", "estart", "eend", "edescription"]
      column_titles_for_event = ["Event Title", "Location", "Start Time", "End Time", "Description"]
		  eventinfo = Event.find(@eid)
		  csv << ["Event Information"]
		  csv << column_titles_for_event
		  csv << eventinfo.attributes.values_at(*column_names_for_event)
		  csv << [""]
		  csv << ["Event Data"]
      #print "Event id: #{@eid}"
      questions = Question.where(eid: @eid).all
      
      csvtitle = ["User Last Name", "User First Name", "User Email", "User Phone Number", "User Address", "User City", "User State", "User Zip Code"]
      qoptionlist = []
      localQlist = []
      questions.each do |q|
      	localQlist << q
      	qoptionlist << q.qoption
      	optionstr = ""
      	if q.qoption != ""
      		optionstr = "(#{q.qoption})"
      	end
      	csvtitle << q.qtitle + optionstr
      end
      #print qoptionlist
      csv << csvtitle

      idlist = []
      ids = Answer.select(:uid).distinct
      ids.each do |uid|
      	idlist << uid.uid
      end
      
      #JUST NEED TO FIX CHECKBOX INPUTS!!! CURRENTLY DISPLAYING LAST ONE IN LIST OF POSSIBLE CHECKBOX CHOICES
	
      # output records order by user ID
  	  
  	  vids = []
  	  viids = []
  	  vbids = []
  	  edids = []
      
      vehicleattrlist = []
      impressionattrlist = []
      vendorattrlist = []
      homeschoolids = []
      homeschoolattrlist = []
      privateschoolids = []
      privateschoolattrlist = []
      
      idlist.each do |uid|
      	user_last_name = User.where(:id => uid).select(:lastname).take[:lastname]
      	user_first_name = User.where(:id => uid).select(:firstname).take[:firstname]
      	user_email = User.where(:id => uid).select(:email).take[:email]
      	user_phone_number = User.where(:id => uid).select(:phonenumber).take[:phonenumber]
      	user_address = User.where(:id => uid).select(:addressline1).take[:addressline1]
      	user_city = User.where(:id => uid).select(:city).take[:city]
      	user_state = User.where(:id => uid).select(:state).take[:state]
      	user_zip = User.where(:id => uid).select(:zipcode).take[:zipcode]
      	answer = Answer.where(:uid => uid)
      	
      	eid = @eid
      	inventvid = Inventorie.where(:uid => uid).where(:eid => eid).select(:inventvid).take[:inventvid]
      	print "Invent vid: " + inventvid.to_s + "\n"
      	inventedid = Inventorie.where(:uid => uid).where(:eid => eid).select(:inventedid).take[:inventedid]
      	print "Invent edid: " + inventedid.to_s + "\n"
      	inventviid = Inventorie.where(:uid => uid).where(:eid => eid).select(:inventviid).take[:inventviid]
      	print "Invent viid: " + inventviid.to_s + "\n"
      	inventvbid = Inventorie.where(:uid => uid).where(:eid => eid).select(:inventvbid).take[:inventvbid]
      	print "Invent vbid: " + inventvbid.to_s + "\n"
      	
      	if inventvid.from(1) != nil
      		vids = (inventvid.from(1).to(-1)).split("_")
      		print "VID: |||" + vids.to_s + "|||\n"
      	end
      	if inventviid.from(1) != nil
      		viids = (inventviid.from(1).to(-1)).split("_")
      		print "VIID: |||" + viids.to_s + "|||\n"
      	end
      	if inventvbid.from(1) != nil
      		vbids = (inventvbid.from(1).to(-1)).split("_")
      		print "VBID: |||" + vbids.to_s + "|||\n"
      	end
      	if inventedid.from(1) != nil
      		edids = (inventedid.from(1).to(-1)).split("_")
      		print "EDID: |||" + edids.to_s + "|||\n"
      	end
      	
      	answerlist = ["#{user_last_name}", "#{user_first_name}", "#{user_email}", "#{user_phone_number}", "#{user_address}", "#{user_city}", "#{user_state}", "#{user_zip}"]
      	qindex = 0
      	answer.each do |ans|
      		if localQlist[qindex] != "" && localQlist[qindex] != nil && ans != nil
	      		while ans.qtitle != localQlist[qindex].qtitle
	      			answerlist << "N/A"
	      			qindex += 1
	      			if localQlist[qindex] == nil
	      				qindex -= 1
	      				break
	      			end
	      		end
	      	end
      		
      		if qoptionlist[qindex] != "" && qoptionlist != nil
      			qoptlist = 	qoptionlist[qindex].split("|")
      			if ans.answer.count("\"") > 2
      				choices = []
      				i = 2
	      			while i < ans.answer.length do
	      				print ans.answer + "\n"
	      				print "Value of i is: " + i.to_s + "\n"
	    					choices << ans.answer[i].to_i
	    					print choices
	    					i += 5
	      			end
	      			list = ""
	      			choices.each do |a|
	      				list += " | " + qoptlist[a - 1].to_s
	      			end
	      			answerlist << "Selected:    " + list.from(3).to(-1)
	      		else
	      			print "\nStandalone answer:   " + (ans.answer.to_i).to_s + "\n"
	      			if Question.where(:qid => ans.qid).where(:eid => eid).select(:qtype).take[:qtype] == "2" #checkboxes
	      				answerlist << qoptlist[ans.answer.to_i]
	      			else
	      				answerlist << qoptlist[ans.answer.to_i - 1]
	      			end
	      		end
      		else	
      			answerlist << ans.answer
      		end
      		qindex += 1
      	end
      	while qindex != qoptionlist.size
      		answerlist << "N/A"
      		qindex += 1
      	end
      	csv << answerlist

			vids.each do |vid|
				print "Vehicle: " + vid.to_s + "\n"
				if Vehicle.where(:id => vid).take != nil
	      	last = User.where(:id => uid).select(:lastname).take[:lastname]
	      	first = User.where(:id => uid).select(:firstname).take[:firstname]
	        vname = Vehicle.where(:id => vid).select(:vname).take[:vname]
	      	vclass = Vehicle.where(:id => vid).where(:user_id => uid).select(:vclass).take[:vclass]
	      	vnation = Vehicle.where(:id => vid).where(:user_id => uid).select(:vnation).take[:vnation]
	      	vwar = Vehicle.where(:id => vid).where(:user_id => uid).select(:vwar).take[:vwar]
	      	vdescription = Vehicle.where(:id => vid).where(:user_id => uid).select(:vdescription).take[:vdescription]
	      	print [last + " ", first + " ", vname + " ", vclass + " ", vnation + " ", vwar + " ", vdescription + " "]
	      	vehicleattrlist << [last + " ", first + " ", vname + " ", vclass + " ", vnation + " ", vwar + " ", vdescription + " "]
				end	
	    end
	      
	    viids.each do |viid|
	    	print "Impression: " + viid.to_s + "\n"
	    	if Impression.where(:id => viid).take != nil
	      	last = User.where(:id => uid).select(:lastname).take[:lastname]
	      	first = User.where(:id => uid).select(:firstname).take[:firstname]
	      	iname = Impression.where(:id => viid).select(:iname).take[:iname]
	      	iunit = Impression.where(:id => viid).select(:unitid).take[:unitid]
	      	iwar = Impression.where(:id => viid).select(:iwar).take[:iwar]
	      	iside = Impression.where(:id => viid).select(:iside).take[:iside]
	      	coname = Impression.where(:id => viid).select(:commander).take[:commander]
	      	idescription = Impression.where(:id => viid).select(:idescription).take[:idescription]
	      	print [last + " ", first + " ", iname + " ", iunit + " ", iwar + " ", iside + " ", coname + " ", idescription + " "]
	      	impressionattrlist << [last + " ", first + " ", iname + " ", iunit + " ", iwar + " ", iside + " ", coname + " ", idescription + " "]
	    	end
	    end
	    
	    vbids.each do |vbid|
	    	print "Vendor: " + vbid.to_s + "\n"
				if Vendorbooth.where(:id => vbid).take != nil
	      	last = User.where(:id => uid).select(:lastname).take[:lastname]
	      	first = User.where(:id => uid).select(:firstname).take[:firstname]
	      	vbname = Vendorbooth.where(:id => vbid).select(:vbname).take[:vbname]
	      	vbdescription = Vendorbooth.where(:id => vbid).select(:vbdescription).take[:vbdescription]
	      	print [last + " ", first + " ", vbname + " ", vbdescription + " "]
	      	vendorattrlist << [last + " ", first + " ", vbname + " ", vbdescription + " "]
				end
	    end
	    
	    edids.each do |edid|
	    	print "Educator: " + edid.to_s + "\n"
				if Educator.where(:id => edid).take != nil
					if Educator.where(:id => edid).select(:edschooltype).take[:edschooltype] == "Home School"
	      		homeschoolids << edid
					elsif Educator.where(:id => edid).select(:edschooltype).take[:edschooltype] == "Private School"
	      		privateschoolids << edid
					end
				end
	    end
	    
	    homeschoolids.each do |id|
	    	print "Home School: " + id.to_s + "\n"
	    	first = User.where(:id => uid).select(:firstname).take[:firstname]
	    	last = User.where(:id => uid).select(:lastname).take[:lastname]
	    	guardianname = Educator.where(:id => id).select(:edpgaurdianname).take[:edpgaurdianname]
      	address = Educator.where(:id => id).select(:edaddress).take[:edaddress]
      	zip = Educator.where(:id => id).select(:edzip).take[:edzip]
        guardianemail = Educator.where(:id => id).select(:edgaurdianemail).take[:edgaurdianemail]
        guardianphone = Educator.where(:id => id).select(:edpgaurdianphone).take[:edpgaurdianphone]
        primaryname = Educator.where(:id => id).select(:edprimaryname).take[:edprimaryname]
        primaryemail = Educator.where(:id => id).select(:edprimaryemail).take[:edprimaryemail]
        primaryphone = Educator.where(:id => id).select(:edprimaryphone).take[:edprimaryphone]
        print ["", "" + first + " " + last + " ", guardianname + " ", address + " ", zip + " ", guardianemail + " ", guardianphone + " ", primaryname + " ", primaryemail + " ", primaryphone + " "]
      	homeschoolattrlist << ["", "" + first + " " + last + " ", guardianname + " ", address + " ", zip + " ", guardianemail + " ", guardianphone + " ", primaryname + " ", primaryemail + " ", primaryphone + " "]
	    end

		  privateschoolids.each do |id|
		  	print "Private School: " + id.to_s + "\n"
		 		first = User.where(:id => uid).select(:firstname).take[:firstname]
	    	last = User.where(:id => uid).select(:lastname).take[:lastname]
	     	schoolname = Educator.where(:id => id).select(:edschoolname).take[:edschoolname]
	     	address = Educator.where(:id => id).select(:edaddress).take[:edaddress]
	     	zip = Educator.where(:id => id).select(:edzip).take[:edzip]
	     	primaryname = Educator.where(:id => id).select(:edprimaryname).take[:edprimaryname]
	     	primaryrole = Educator.where(:id => id).select(:edprimaryrole).take[:edprimaryrole]
	    	primaryemail = Educator.where(:id => id).select(:edprimaryemail).take[:edprimaryemail]
	    	primaryphone = Educator.where(:id => id).select(:edprimaryphone).take[:edprimaryphone]
	    	princename = Educator.where(:id => id).select(:edprinciplename).take[:edprinciplename]
	    	princeemail = Educator.where(:id => id).select(:edprincipleemail).take[:edprincipleemail]
	    	print ["", "" + first + " " + last + " ", schoolname + " ", address + " ", zip + " ", primaryname + " ", primaryrole + " ", primaryemail + " ", primaryphone + " ", princename + " ", princeemail + " "]
	     	privateschoolattrlist << ["", "" + first + " " + last + " ", schoolname + " ", address + " ", zip + " ", primaryname + " ", primaryrole + " ", primaryemail + " ", primaryphone + " ", princename + " ", princeemail + " "]
	    end

      end
      
      #setup registered and selected 'roles' section
      csv << [""]
      csv << [""]
      csv << [""]
      csv << [""]
      
      csv << ["Vehicles Being Brought"]
      csv << ["User Last Name","User First Name","Vehicle Name","Vehicle Class","Vehicle Nation","Vehicle War","Vehicle Description"]
      
      
      vehicleattrlist.each do |v|
      	csv << v
      end
      
      csv << [""]
      csv << [""]
      csv << [""]
      csv << [""]
      
      csv << ["Impressions Participating in Event"]
      csv << ["User Last Name","User First Name","Impression Name","Unit","War","Side","Name of Commanding Officer","Impression Description"]
      
      
      impressionattrlist.each do |i|
      	csv << i
      end
      
      csv << [""]
      csv << [""]
      csv << [""]
      csv << [""]
      
      csv << ["Vendor Booths Participating in Event"]
      csv << ["User Last Name","User First Name","Booth Name","Booth Description"]
      
      
      vendorattrlist.each do |vb|
      	csv << vb
      end
      
      csv << [""]
      csv << [""]
      csv << [""]
      csv << [""]
      
      csv << ["Educators in Attendance"]
      csv << ["Home Schools"]
      csv << ["", "Registered By:", "Name of Parent/Guardian Chaperoning", "Address", "Zipcode", "Email", "Phone", "Primary Contact's Name", "Primary Contact's Email", "Primary Contact's Phone #"]
      
      
      homeschoolattrlist.each do |h|
      	csv << h
      end
      
      csv << [""]
      csv << [""]
      
      csv << ["Private Schools"]
      csv << ["", "Registered By:", "School Name", "School Address", "School Zipcode", "Primary Contact's Name", "Role of Primary Contact", "Primary Contact's Email", "Primary Contact's Phone #", "Name of School Principal", "School Principle's Email"]
      
      
      privateschoolattrlist.each do |pr|
      	csv << pr
      end
    end
	end
end
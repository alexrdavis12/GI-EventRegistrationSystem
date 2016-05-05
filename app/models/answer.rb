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
	      print qoptionlist
	      csv << csvtitle

	      idlist = []
	      ids = Answer.select(:uid).distinct
	      ids.each do |uid|
	      	idlist << uid.uid
	      end
	      
	      #JUST NEED TO FIX CHECKBOX INPUTS!!! CURRENTLY DISPLAYING LAST ONE IN LIST OF POSSIBLE CHECKBOX CHOICES
		
	      # output records order by user ID
	      vehicles = []
      	  educators = []
      	  impressions = []
      	  vendors = []
      	  
      	  vids = []
      	  viids = []
      	  vbids = []
      	  edids = []
	      
	      vehicleattrlist = []
	      impressionattrlist = []
	      vendorattrlist = []
	      homeschools = []
	      homeschoolattrlist = []
	      privateschools = []
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
	      	inventedid = Inventorie.where(:uid => uid).where(:eid => eid).select(:inventedid).take[:inventedid]
	      	inventviid = Inventorie.where(:uid => uid).where(:eid => eid).select(:inventviid).take[:inventviid]
	      	inventvbid = Inventorie.where(:uid => uid).where(:eid => eid).select(:inventvbid).take[:inventvbid]
	      	
	      	vids = (inventvid.from(1).to(-1)).split("_")
	      	# vids.each do |v|
	      	# 	if Vehicle.where(:uid => uid).where(:vid => v) != nil
	      	# 		vehicles << Vehicle.where(:uid => uid).where(:vid => v).take
	      	# 	end
	      	# end
	      	viids = (inventviid.from(1).to(-1)).split("_")
	      	# viids.each do |viid|
	      	# 	if Impression.where(:uid => uid).where(:viid => viid) != nil
		    #		impressions << Impression.where(:uid => uid).where(:viid => viid).take
		    #	end
	      	# end
	      	vbids = (inventvbid.from(1).to(-1)).split("_")
	      	# vbids.each do |vbid|
	      	# 	if Vendorbooth.where(:uid => uid).where(:vbid => vbid) != nil
	      	# 		vendors << Vendorbooth.where(:uid => uid).where(:vbid => vbid).take
	      	# 	end
	      	# end
	      	edids = (inventedid.from(1).to(-1)).split("_")
	      	# edids.each do |edid|
	      	# 	if Educator.where(:uid => uid).where(:edid => edid) != nil
	      	# 		educators << Educator.where(:uid => uid).where(:edid => edid).take
	      	# 	end
	      	# end
	      	
	      	answerlist = ["#{user_last_name}", "#{user_first_name}", "#{user_email}", "#{user_phone_number}", "#{user_address}", "#{user_city}", "#{user_state}", "#{user_zip}"]
	      	qindex = 0
	      	answer.each do |ans|
	      		#check if a field was skipped (compare ans.answer and qoptionlist)
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
	      			answerlist << qoptlist[ans.answer.to_i - 1]
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

			#MOVE SETUP HERE SO WE CAN CHECK UID FOR EACH 
			# vids.each do |vid|
		 #     	last = User.where(:id => uid).select(:lastname).take[:lastname]
		 #     	first = User.where(:id => uid).select(:firstname).take[:firstname]
		 #     	vname = Vehicle.where(:vid => vid).where(:user_id => uid).select(:vname).take[:vname]
		 #     	vclass = Vehicle.where(:vid => vid).where(:user_id => uid).select(:vclass).take[:vclass]
		 #     	vnation = Vehicle.where(:vid => vid).where(:user_id => uid).select(:vnation).take[:vnation]
		 #     	vwar = Vehicle.where(:vid => vid).where(:user_id => uid).select(:vwar).take[:vwar]
		 #     	vdescription = Vehicle.where(:vid => vid).where(:user_id => uid).select(:vdescription).take[:vdescription]
		 #     	vehicleattrlist << [last, first, vname, vclass, vnation, vwar, vdescription]
		 #   end
		      
		 #   viids.each do |viid|
		 #     	last = User.where(:uid => Impression.where(:iid => viid).select(:user_id).take[:user_id]).select(:lastname).take[:lastname]
		 #     	first = User.where(:uid => Impression.where(:iid => viid).select(:user_id).take[:user_id]).select(:firstname).take[:firstname]
		 #     	iname = Impression.where(:iid => viid).select(:iname).take[:iname]
		 #     	iunit = Unit.where(:unitid => Impression.where(:iid => viid).select(:unitid).take[:unitid]).select(:uname).take[uname]
		 #     	iwar = Impression.where(:iid => viid).select(:iwar).take[:iwar]
		 #     	iside = Impression.where(:iid => viid).select(:iside).take[:iside]
		 #     	coname = Impression.where(:iid => viid).select(:commander).take[:commander]
		 #     	idescription = Impression.where(:iid => viid).select(:idescription).take[:idescription]
		 #     	vehicleattrlist << [last, first, iname, iunit, iwar, iside, coname, idescription]
		 #   end
		    
		 #   vbids.each do |vbid|
		 #     	last = User.where(:uid => Vendorbooth.where(:vbid => vbid).select(:uid).take[:uid]).select(:lastname).take[:lastname]
		 #     	first = User.where(:uid => Vendorbooth.where(:vbid => vbid).select(:uid).take[:uid]).select(:firstname).take[:firstname]
		 #     	vbname = Vendorbooth.where(:vbid => vbid).select(:vbname).take[:vbname]
		 #     	vbdescription = Vendorbooth.where(:vbid => vbid).select(:vbdescription).take[:vbdescription]
		 #     	vehicleattrlist << [last, first, vbname, vbdescription]
		 #   end
		    
		 #   edids.each do |edid|
		 #   	if Educator.where(:edid => edid).select(:edschooltype).take[:edschooltype] == "Home School"
		 #     		homeschoolids << edid
		 #     	elsif Educator.where(:edid => edid).select(:edschooltype).take[:edschooltype] == "Private School"
		 #     		privateschoolids << edid
		 #     	end
		 #   end
		    
		 #   homeschoolids.each do |id|
		 #   	guardianname = Educator.where(:edid => id).select(:edpgaurdianname).take[:edpgaurdianname]
		 #     	address = Educator.where(:edid => id).select(:edaddress).take[:edaddress]
		 #     	zip = Educator.where(:edid => id).select(:edzip).take[:edzip]
		 #       guardianemail = Educator.where(:edid => id).select(:edgaurdianemail).take[:edgaurdianemail]
		 #       guardianphone = Educator.where(:edid => id).select(:edpgaurdianphone).take[:edpgaurdianphone]
		 #       primaryname = Educator.where(:edid => id).select(:edprimaryname).take[:edprimaryname]
		 #       primaryemail = Educator.where(:edid => id).select(:edprimaryemail).take[:edprimaryemail]
		 #       primaryphone = Educator.where(:edid => id).select(:edprimaryphone).take[:edprimaryphone]
		 #     	homeschoolattrlist << ["", guardianname, address, zip, guardianemail, guardianphone, primaryname, primaryemail, primaryphone]
		 #   end

			# homeschoolids.each do |id|
		 #     	guardianname = Educator.where(:edid => id).select(:edpgaurdianname).take[:edpgaurdianname]
		 #     	address = Educator.where(:edid => id).select(:edaddress).take[:edaddress]
		 #     	zip = Educator.where(:edid => id).select(:edzip).take[:edzip]
		 #       guardianemail = Educator.where(:edid => id).select(:edgaurdianemail).take[:edgaurdianemail]
		 #       guardianphone = Educator.where(:edid => id).select(:edpgaurdianphone).take[:edpgaurdianphone]
		 #       primaryname = Educator.where(:edid => id).select(:edprimaryname).take[:edprimaryname]
		 #       primaryemail = Educator.where(:edid => id).select(:edprimaryemail).take[:edprimaryemail]
		 #       primaryphone = Educator.where(:edid => id).select(:edprimaryphone).take[:edprimaryphone]
		 #     	homeschoolattrlist << ["", guardianname, address, zip, guardianemail, guardianphone, primaryname, primaryemail, primaryphone]
		 #   end

	      end
	      
	      #setup registered and selected 'roles' section
	      csv << [""]
	      csv << [""]
	      csv << [""]
	      csv << [""]
	      
	      csv << ["Vehicles Being Brought"]
	      csv << ["User Last Name","User First Name","Vehicle Name","Vehicle Class","Vehicle Nation","Vehicle War","Vehicle Description"]
	      
	      #ITERATE THROUGH VEHICLES BEING BROUGHT AND LIST INFORMATION
	      #vehicleattrlist = []
	      
	      #vids.each do |vid|
	      #	checkid = Vehicle.where(:vid => vid).select(:user_id).take[:user_id]
	      #	last = User.where(:id => checkid).select(:lastname).take[:lastname]
	      #	first = User.where(:id => Vehicle.where(:vid => vid).select(:user_id).take[:user_id]).select(:firstname).take[:firstname]
	      #	vname = Vehicle.where(:vid => vid).select(:vname).take[:vname]
	      #	vclass = Vehicle.where(:vid => vid).select(:vclass).take[:vclass]
	      #	vnation = Vehicle.where(:vid => vid).select(:vnation).take[:vnation]
	      #	vwar = Vehicle.where(:vid => vid).select(:vwar).take[:vwar]
	      #	vdescription = Vehicle.where(:vid => vid).select(:vdescription).take[:vdescription]
	      #	vehicleattrlist << [last, first, vname, vclass, vnation, vwar, vdescription]
	      #end
	      
	      #vehicles.each do |vehicle|
	      #	last = User.where(:uid => vehicle.user_id).select(:lastname).take[:lastname]
	      #	first = User.where(:uid => vehicle.user_id).select(:firstname).take[:firstname]
	      #	vehicleattrlist << [last, first, vehicle.vname, vehicle.vclass, vehicle.vnation, vehicle.vwar, vehicle.vdescription]
	      #end
	      vehicleattrlist.each do |v|
	      	csv << v
	      end
	      
	      csv << [""]
	      csv << [""]
	      csv << [""]
	      csv << [""]
	      
	      csv << ["Impressions Participating in Event"]
	      csv << ["User Last Name","User First Name","Impression Name","Unit","War","Side","Name of Commanding Officer","Impression Description"]
	      
	      #ITERATE THROUGH IMPRESSIONS PARTICIPATING IN EVENT AND LIST INFORMATION
	      #impressionattrlist = []
	      
	      #viids.each do |viid|
	      #	last = User.where(:uid => Impression.where(:iid => viid).select(:user_id).take[:user_id]).select(:lastname).take[:lastname]
	      #	first = User.where(:uid => Impression.where(:iid => viid).select(:user_id).take[:user_id]).select(:firstname).take[:firstname]
	      #	iname = Impression.where(:iid => viid).select(:iname).take[:iname]
	      #	iunit = Unit.where(:unitid => Impression.where(:iid => viid).select(:unitid).take[:unitid]).select(:uname).take[uname]
	      #	iwar = Impression.where(:iid => viid).select(:iwar).take[:iwar]
	      #	iside = Impression.where(:iid => viid).select(:iside).take[:iside]
	      #	coname = Impression.where(:iid => viid).select(:commander).take[:commander]
	      #	idescription = Impression.where(:iid => viid).select(:idescription).take[:idescription]
	      #	vehicleattrlist << [last, first, iname, iunit, iwar, iside, coname, idescription]
	      #end
	      
	      #impressions.each do |impression|
	      #	impressionattrlist << [User.where(:uid => impression.uid).select(:lastname).take[l:astname], User.where(:uid => impression.uid).select(:firstname).take[:firstname], impression.iname, Unit.where(:unitid => impression.unitid).select(:uname).take[uname], impression.iwar, impression.iside, impression.commander, impression.idescription]
	      #end
	      impressionattrlist.each do |i|
	      	csv << i
	      end
	      
	      csv << [""]
	      csv << [""]
	      csv << [""]
	      csv << [""]
	      
	      csv << ["Vendor Booths Participating in Event"]
	      csv << ["User Last Name","User First Name","Booth Name","Booth Description"]
	      
	      #ITERATE THROUGH VENDOR BOOTHS PARTICIPATING IN EVENT AND LIST INFORMATION
	      #vendorattrlist = []
	      
	      #vbids.each do |vbid|
	      #	last = User.where(:uid => Vendorbooth.where(:vbid => vbid).select(:uid).take[:uid]).select(:lastname).take[:lastname]
	      #	first = User.where(:uid => Vendorbooth.where(:vbid => vbid).select(:uid).take[:uid]).select(:firstname).take[:firstname]
	      #	vbname = Vendorbooth.where(:vbid => vbid).select(:vbname).take[:vbname]
	      #	vbdescription = Vendorbooth.where(:vbid => vbid).select(:vbdescription).take[:vbdescription]
	      #	vehicleattrlist << [last, first, vbname, vbdescription]
	      #end
	      
	      #vendors.each do |vendor|
	      #	vendorattrlist << [User.where(:uid => vendor.user_id).select(:lastname).take[:lastname], User.where(:uid => vendor.user_id).select(:firstname).take[:firstname], vendor.vbname, vendor.vbdescription]
	      #end
	      vendorattrlist.each do |vb|
	      	csv << vb
	      end
	      
	      csv << [""]
	      csv << [""]
	      csv << [""]
	      csv << [""]
	      
	      csv << ["Educators in Attendance"]
	      csv << ["Home Schools"]
	      firstname = "Change this value"
	      lastname = "Change this value"
	      csv << ["", "Registered by " + firstname + " " + lastname]
	      csv << ["", "Name of Parent/Guardian Chaperoning", "Address", "Zipcode", "Email", "Phone", "Primary Contact's Name", "Primary Contact's Email", "Primary Contact's Phone #"]
	      
	      #ITERATE THROUGH HOME SCHOOL EDUCATORS IN ATTENDANCE AND LIST INFORMATION
	      #homeschools = []
	      #homeschoolattrlist = []
	      #privateschools = []
	      #privateschoolattrlist = []
	      
	      #edids.each do |edid|
	      #	if Educator.where(:edid => edid).select(:edschooltype).take[:edschooltype] == "Home School"
	      #		homeschoolids << edid
	      #	elsif Educator.where(:edid => edid).select(:edschooltype).take[:edschooltype] == "Private School"
	      #		privateschoolids << edid
	      #	end
	      #end
	      
	      #educators.each do |ed|
	      #	if ed.edschooltype == "Home School"
	      #		homeschools << ed
	      #	elsif ed.edschooltype == "Private School"
	      #		privateschools << ed
	      #	end
	      #end
	      
	      #homeschoolids.each do |id|
	      #	guardianname = Educator.where(:edid => id).select(:edpgaurdianname).take[:edpgaurdianname]
	      #	address = Educator.where(:edid => id).select(:edaddress).take[:edaddress]
	      #	zip = Educator.where(:edid => id).select(:edzip).take[:edzip]
	      #  guardianemail = Educator.where(:edid => id).select(:edgaurdianemail).take[:edgaurdianemail]
	      #  guardianphone = Educator.where(:edid => id).select(:edpgaurdianphone).take[:edpgaurdianphone]
	      #  primaryname = Educator.where(:edid => id).select(:edprimaryname).take[:edprimaryname]
	      #  primaryemail = Educator.where(:edid => id).select(:edprimaryemail).take[:edprimaryemail]
	      #  primaryphone = Educator.where(:edid => id).select(:edprimaryphone).take[:edprimaryphone]
	      #	homeschoolattrlist << ["", guardianname, address, zip, guardianemail, guardianphone, primaryname, primaryemail, primaryphone]
	      #end
	      
	      #homeschools.each do |home|
	      #	homeschoolattrlist << ["", home.edpgaurdianname, home.edaddress, home.edzip, home.edgaurdianemail, home.edpgaurdianphone, home.edprimaryname, home.edprimaryemail, home.edprimaryphone]
	      #end
	      homeschoolattrlist.each do |h|
	      	csv << h
	      end
	      
	      csv << [""]
	      csv << [""]
	      
	      csv << ["Private Schools"]
	      firstname = "Change this value"
	      lastname = "Change this value"
	      csv << ["", "Registered by " + firstname + " " + lastname]
	      csv << ["", "School Name", "School Address", "School Zipcode", "Primary Contact's Name", "Role of Primary Contact", "Primary Contact's Email", "Primary Contact's Phone #", "Name of School Principal", "School Principle's Email"]
	      
	      #ITERATE THROUGH PRIVATE SCHOOL EDUCATORS IN ATTENDANCE AND LIST INFORMATION
	      
	      #privateschoolids.each do |id|
	      #	schoolname = Educator.where(:edid => id).select(:edschoolname).take[:edschoolname]
	      #	address = Educator.where(:edid => id).select(:edaddress).take[:edaddress]
	      #	zip = Educator.where(:edid => id).select(:edzip).take[:edzip]
	      #	primaryname = Educator.where(:edid => id).select(:edprimaryname).take[:edprimaryname]
	      #	primaryrole = Educator.where(:edid => id).select(:edprimaryrole).take[:edprimaryrole]
	      #  primaryemail = Educator.where(:edid => id).select(:edprimaryemail).take[:edprimaryemail]
	      #  primaryphone = Educator.where(:edid => id).select(:edprimaryphone).take[:edprimaryphone]
	      #  princename = Educator.where(:edid => id).select(:edprinciplename).take[:edprinciplename]
	      #  princeemail = Educator.where(:edid => id).select(:edprincipleemail).take[:edprincipleemail]
	      #	homeschoolattrlist << ["", schoolname, address, zip, primaryname, primaryrole, primaryemail, primaryphone, princename, princeemail]
	      #end
	      
	      #privateschools.each do |priv|
	      #	privateschoolattrlist << ["", priv.edschoolname, priv.edaddress, priv.edzip, priv.edprimaryname, priv.edprimaryrole, priv.edprimaryemail, priv.edprimaryphone, priv.edprinciplename, priv.edprincipleemail]
	      #end
	      privateschoolattrlist.each do |pr|
	      	csv << pr
	      end
	      
	    #   column_title = ["Record ID", "Event ID", "Email", "Question ID", "Answer", "Created at", "Updated at", "Question Title"]
	    #   csv << column_title
	    #   all = Answer.all
	    #   all.each do |answer|
	    #   	record = answer.attributes.values_at(*column_names)
	    #   	usr_id = record[2]
	    #   	user_email = User.where(:id => usr_id).select(:email).take[:email]
	    #   	record[2] = user_email
	    #     csv << record
	    # end
	    end
  end
end
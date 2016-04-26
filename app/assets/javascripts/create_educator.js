$(document).ready(function(){
	
		//onclick for the private school radio button
    	$('#private_school').click(function(evt){
			evt.stopImmediatePropagation();
			
        	//add the questions in a named div for private school people
			private_string = "<div class='form-group' id='private_school_form' name='psf'>\
		                  		<label> School Name </label>\
		                  		<br/>\
		                  		<input type=text name=SchoolName required>\
		                  		<br/><br/>\
		                  		<label> School Address </label>\
		                  		<br/>\
		                  		<input type=text name=Address required>\
								<br/><br/>\
		                  		<label> Zip Code </label>\
		                  		<br/>\
		                  		<input type=text name=Zip required>\
								<br/><br/>\
		                  		<label> Name of Primary Contact(The person that will supervise the students at the event) </label>\
		                  		<br/>\
		                  		<input type=text name=PrimaryName required>\
								<br/><br/>\
		                  		<label> Role of Primary Contact </label>\
		                  		<br/>\
		                  		<input type='radio' name='PrimaryRole' value='Teacher' required> Teacher <br>\
								<input type='radio' name='PrimaryRole' value='Parent' required> Parent <br>\
								<br/>\
								<label> Primary Contact's Email </label>\
								<br/>\
								<input type=text name=PrimaryEmail required>\
								<br/><br/>\
								<label> Primary Contact's Phone Number </label>\
								<br/>\
								<input type=text name=PrimaryPhone required>\
								<br/><br/>\
								<label> Principal's Name </label>\
								<br/>\
								<input type=text name=PrincipleName required>\
								<br/><br/>\
								<label> Principal's Email </label>\
								<br/>\
								<input type=text name=PrincipleEmail required>\
								<br/><br/>\
		                	 </div>";
		     if( $("#home_school_form").length > 0){
				var element = document.getElementById("home_school_form");
				element.parentNode.removeChild(element);
			  }                   
		     //this button has been selected but only add it one time
			 if( $("#private_school_form").length == 0){
				$("#ed_form").append(private_string);
		    	
			  }
		 });
    	
    	//onclick for the homeschool radio button
    	$('#home_school').click(function(evt){
			evt.stopImmediatePropagation();
			// 	add the questions in a named div for private school people
            home_string = "<div class='form-group' id='home_school_form'>\
		                  		<label> Parent / Guardian Name </label>\
		                  		<br/>\
		                  		<input type=text name=GuardianName required>\
		                  		<br/><br/>\
		                  		<label> Address </label>\
		                  		<br/>\
		                  		<input type=text name=Address required>\
								<br/><br/>\
		                  		<label> Zip Code </label>\
		                  		<br/>\
		                  		<input type=text name=Zip required>\
								<br/><br/>\
		                  		<label> Email </label>\
		                  		<br/>\
		                  		<input type=text name=GuardianEmail required>\
		                  		<br/><br/>\
		                  		<label> Phone </label>\
		                  		<br/>\
		                  		<input type=text name=GuardianPhone required>\
								<br/><br/>\
								<label> Primary Contact Name </label>\
		                  		<br/>\
		                  		<input type=text name=PrimaryName required>\
		                  		<br/><br/>\
								<label> Primary Contact's Email </label>\
								<br/>\
								<input type=text name=PrimaryEmail required>\
								<br/><br/>\
								<label> Primary Contact's Phone Number </label>\
								<br/>\
								<input type=text name=PrimaryPhone required>\
								<br/><br/>\
		                	 </div>";
		     if( $("#private_school_form").length > 0){
				var element = document.getElementById("private_school_form");
				element.parentNode.removeChild(element);
			  }           	 
		      if( $("#home_school_form").length == 0){
				$("#ed_form").append(home_string);

			  }           	 
    	});
    	
    	
});
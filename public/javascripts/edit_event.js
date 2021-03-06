// This handles adding questions and pre-populating existing
function delete_option(qid, cnt) {
	$("#Q" + qid + "_" + cnt).remove();
}

function delete_optionforsub(qid, option_id, subqcnt, cnt) {
	$("#Q" + qid + "_" + option_id + "_" + subqcnt + "_" + cnt).remove();
}


function delete_question(qid) {
	$("#Q" + qid).remove();
}

function delete_subquestion(qid, option_id, subqcnt) {
	$("#QQ" + qid + '_' + option_id + '_' + subqcnt).remove();
}


function add_optionsforsub(qid, option_id, subqcnt) {
	cnt = $("#Q" + qid + "_" + option_id + "_" + subqcnt + "_optcnt").val();
	$("#Q" + qid + "_" + option_id + "_" + subqcnt + "_optcnt").val(++cnt);
	$("#Q" + qid + "_" + option_id + "_" + subqcnt + "_sub_options_list").append("<div class='form-group' id='Q" + qid+ "_" + option_id + "_" + subqcnt + "_" + cnt + "' style='margin-bottom: 15px'>\
												     <div class='col-xs-11' style='margin-bottom: 5px'>\
													 	<input class='form-control' name='S" + qid + "_" + option_id + "_" + subqcnt + "[opt" + cnt + "]' value='' required>\
													 </div>\
													 <div class='col-xs-1' style='margin-bottom: 5px'>\
														 <a class='btn btn-danger pull-right' id='Q" + qid + "_SO"+cnt+"' href='javascript:delete_optionforsub("+ qid + "," + option_id + ","+ subqcnt + "," + cnt + ")'>\
														 	<i class='fa fa-trash-o fa-lg'></i>\
														 </a>\
													 </div>\
												 </div>");
}

function orig_add_optionsforsub(qid, option_id, subqcnt, input) {
	cnt = $("#Q" + qid + "_" + option_id + "_" + subqcnt + "_optcnt").val();
	$("#Q" + qid + "_" + option_id + "_" + subqcnt + "_optcnt").val(++cnt);
	$("#Q" + qid + "_" + option_id + "_" + subqcnt + "_sub_options_list").append("<div class='form-group' id='Q" + qid+ "_" + option_id + "_" + subqcnt + "_" + cnt + "' style='margin-bottom: 15px'>\
												     <div class='col-xs-11' style='margin-bottom: 5px'>\
													 	<input class='form-control' name='S" + qid + "_" + option_id + "_" + subqcnt + "[opt" + cnt + "]' value='" + input + "' required>\
													 </div>\
													 <div class='col-xs-1' style='margin-bottom: 5px'>\
														 <a class='btn btn-danger pull-right' id='Q" + qid + "_SO"+cnt+"' href='javascript:delete_optionforsub("+ qid + "," + option_id + ","+ subqcnt + "," + cnt + ")'>\
														 	<i class='fa fa-trash-o fa-lg'></i>\
														 </a>\
													 </div>\
												 </div>");
}

function add_options(qid) {
	vis = ""
	cnt = $("#Q" + qid + "_optcnt").val();
	$("#Q" + qid + "_optcnt").val(++cnt);
	$("#Q" + qid + "_options_list").append("<div class='form-group' id='Q" + qid+ "_" + cnt + "' >\
											 <input class='form-control'  name='Q" + qid + "[opt" + cnt + "]' value='' required>\
											 <a class='btn btn-danger pull-right' id='Q" + qid + "_O"+cnt+"' href='javascript:delete_option("+ qid + "," + cnt + ")' value='vis' style='margin-top: 15px'>\
											 	<i class='fa fa-trash-o fa-lg'></i>\
											 	Delete Option\
											 </a>\
											 <a class='btn btn-success' href='javascript:add_subquestion(" + qid + "," + cnt + ")' style='margin-top: 15px'>\
											 	<i class='fa fa-plus fa-lg'></i>\
											 	Add Sub-question\
											 </a>\
											 <input id='Q" + qid + "_" + cnt + "_subqcnt' type='hidden' value='0'>\
										 </div>\
										 ");
}

function orig_add_options(qid, input) {
	vis = ""
	cnt = $("#Q" + qid + "_optcnt").val();
	$("#Q" + qid + "_optcnt").val(++cnt);
	$("#Q" + qid + "_options_list").append("<div class='form-group' id='Q" + qid+ "_" + cnt + "' >\
											 <input class='form-control'  name='Q" + qid + "[opt" + cnt + "]' value='" + input + "' required>\
											 <a class='btn btn-danger pull-right' id='Q" + qid + "_O"+cnt+"' href='javascript:delete_option("+ qid + "," + cnt + ")' value='vis' style='margin-top: 15px'>\
											 	<i class='fa fa-trash-o fa-lg'></i>\
											 	Delete Option\
											 </a>\
											 <a class='btn btn-success' href='javascript:add_subquestion(" + qid + "," + cnt + ")' style='margin-top: 15px'>\
											 	<i class='fa fa-plus fa-lg'></i>\
											 	Add Sub-question\
											 </a>\
											 <input id='Q" + qid + "_" + cnt + "_subqcnt' type='hidden' value='0'>\
										 </div>\
										 ");
}

function add_subquestion(select_qid, option_id) {
	cnt = $("#Q" + select_qid + "_" + option_id + "_subqcnt").val();
	$("#Q" + select_qid + "_" + option_id + "_subqcnt").val(++cnt);
	q_type_str = '<div class="form-group">\
					<div class="form-group">\
					  <label>Type </label>\
					  <select class="form-control" belong="' + select_qid + '_'+ option_id + '_' + cnt +'" name="S' + select_qid + '_' + option_id + '_' + cnt +'[type]">\
	                      <option value="1">Text</option>\
	                      <option value="2">Checkboxes</option>\
	                      <option value="3">Radio Buttons</option>\
	                      <option value="4">Dropdown</option>\
	                      <option value="5">Paragraph Text</option>\
                	  </select>\
                	</div>\
                	  <a class="btn btn-danger pull-right" href="javascript:delete_subquestion(' + select_qid + ', ' + option_id + ',' + cnt + ')">\
                	  	<i class="fa fa-trash-o fa-lg"></i>\
                	  	Delete Sub-question\
                	  </a>\
                  </div>';
    if($("#Q" + select_qid + "_" + option_id+"_list").length == 1)  //A list has been previously created for this set of subquestions so use it
    {
    	 str = 	"<div class='panel panel-danger' id='QQ" + select_qid + "_" + option_id + "_" + cnt + "' style='margin-top: 15px'>\
    	 			<div class='panel-heading'>\
    	 				<h3 class='panel-title'>\
    	 					Sub-question\
    	 					<a class='btn btn-sm pull-right' id='QQ" + select_qid + "_" + option_id + "_" + cnt + "_up' style='color: #500000; background: none; outline: 0;'\
    	 					href='javascript:move_subq_up("+select_qid + "," + option_id + "," + cnt + ")'>\
    	 						<i class='fa fa-chevron-up fa-lg'/>\
    	 					</a>\
    	 					<a class='btn btn-sm pull-right' id='QQ" + select_qid + "_" + option_id + "_" + cnt + "_down' style='color: #500000; background: none; outline: 0'\
    	 					href='javascript:move_subq_down(" + select_qid + "," + option_id + "," + cnt + ")'>\
    	 						<i class='fa fa-chevron-down fa-lg'></i>\
    	 					</a>\
    	 				</h3>\
    	 			</div>\
    	 			<div class='panel-body' style='background-color:#f2dede'>\
    	 				<div class='form-group'><input class='form-control' name='S" + select_qid + "_" + option_id + "_" + cnt + "[title]' value='' required>\
    	 				</div>\
    	 				"+ q_type_str +"\
    	 			</div>\
    	 		</div>";
    	 $("#Q" + select_qid + "_" + option_id+"_list").append(str);
    	 hookClickSel();
    }
    else //A list has not been previously created for this set of subquestions so create one
    {
    	str = 	"<li id='Q" + select_qid + "_" + option_id+"_list' style='list-style-type:none'>\
    				<div class='panel panel-danger' id='QQ" + select_qid + "_" + option_id + "_" + cnt + "' style='margin-top: 15px'>\
	    				<div class='panel-heading'>\
	    					<h3 class='panel-title'>\
	    						Sub-question\
	    						<a class='btn btn-sm pull-right' id='QQ" + select_qid + "_" + option_id + "_" + cnt + "_up' style='color: #500000; background: none; outline: 0;'\
	    						href='javascript:move_subq_up(" + select_qid + "," + option_id + "," + cnt + ")'>\
	    							<i class='fa fa-chevron-up fa-lg'/>\
	    						</a>\
	    						<a class='btn btn-sm pull-right'  id='QQ" + select_qid + "_" + option_id + "_" + cnt + "_down' style='color:#500000; background: none; outline: 0'\
	    						href='javascript:move_subq_down(" + select_qid + "," + option_id + "," + cnt + ")'>\
	    							<i class='fa fa-chevron-down fa-lg'/>\
	    						</a>\
	    					</h3>\
	    				</div>\
    					<div class='panel-body'  style='background-color:#f2dede'>\
    						<div class='form-group'>\
    							<input class='form-control' name='S" + select_qid + "_" + option_id + "_" + cnt + "[title]' value='' required>\
    						</div>" + q_type_str + "\
    					</div>\
    				</div>\
    			</li>";
    	$("#Q" + select_qid + "_O" + option_id).before(str);	
    	hookClickSel();
    }
	
		hookClickSel();


}

function orig_add_subquestion(select_qid, option_id, select_type, input, optlist) {
	cnt = $("#Q" + select_qid + "_" + option_id + "_subqcnt").val();
	$("#Q" + select_qid + "_" + option_id + "_subqcnt").val(++cnt);
	selected1 = ''
	selected2 = ''
	selected3 = ''
	selected4 = ''
	selected5 = ''
	if(select_type == 1) 
	{
		selected1 = ' selected= "selected"'
	}
	else if(select_type == 2)
	{
		selected2 = ' selected= "selected"'
	}
	else if(select_type == 3)
	{
		selected3 = ' selected= "selected"'
	}
	else if(select_type == 4)
	{
		selected4 = ' selected= "selected"'
	}
	else if(select_type == 5)
	{
		selected5 = ' selected= "selected"'
	}
	q_type_str = '<div class="form-group">\
					<div class="form-group">\
					  <label>Type </label>\
					  <select class="form-control" id= "S' + select_qid + '_' + option_id + '_' + cnt + '" value= "' + select_type + '" info="' + select_type + '" belong="' + select_qid + '_'+ option_id + '_' + cnt + '" name="S' + select_qid + '_' + option_id + '_' + cnt +'[type]">\
	                      <option value="1"' + selected1 + '>Text</option>\
	                      <option value="2"' + selected2 + '>Checkboxes</option>\
	                      <option value="3"' + selected3 + '>Radio Buttons</option>\
	                      <option value="4"' + selected4 + '>Dropdown</option>\
	                      <option value="5"' + selected5 + '>Paragraph Text</option>\
                	  </select>\
                	</div>\
                	  <a class="btn btn-danger pull-right" href="javascript:delete_subquestion(' + select_qid + ', ' + option_id + ',' + cnt + ')">\
                	  	<i class="fa fa-trash-o fa-lg"></i>\
                	  	Delete Sub-question\
                	  </a>\
                  </div>';
    if($("#Q" + select_qid + "_" + option_id+"_list").length == 1)  //A list has been previously created for this set of subquestions so use it
    {
    	 str = 	"<div class='panel panel-danger' id='QQ" + select_qid + "_" + option_id + "_" + cnt + "' style='margin-top: 15px'>\
    	 			<div class='panel-heading'>\
    	 				<h3 class='panel-title'>\
    	 					Sub-question\
    	 					<a class='btn btn-sm pull-right' id='QQ" + select_qid + "_" + option_id + "_" + cnt + "_up' style='color: #500000; background: none; outline: 0;'\
    	 					href='javascript:move_subq_up("+select_qid + "," + option_id + "," + cnt + ")'>\
    	 						<i class='fa fa-chevron-up fa-lg'/>\
    	 					</a>\
    	 					<a class='btn btn-sm pull-right' id='QQ" + select_qid + "_" + option_id + "_" + cnt + "_down' style='color: #500000; background: none; outline: 0'\
    	 					href='javascript:move_subq_down(" + select_qid + "," + option_id + "," + cnt + ")'>\
    	 						<i class='fa fa-chevron-down fa-lg'></i>\
    	 					</a>\
    	 				</h3>\
    	 			</div>\
    	 			<div class='panel-body' style='background-color:#f2dede'>\
    	 				<div class='form-group'><input class='form-control' name='S" + select_qid + "_" + option_id + "_" + cnt + "[title]' value='" + input + "' required>\
    	 				</div>\
    	 				"+ q_type_str +"\
    	 			</div>\
    	 		</div>";
    	 $("#Q" + select_qid + "_" + option_id+"_list").append(str);
    	 hookClickSel();
    }
    else //A list has not been previously created for this set of subquestions so create one
    {
    	str = 	"<li id='Q" + select_qid + "_" + option_id+"_list' style='list-style-type:none'>\
    				<div class='panel panel-danger' id='QQ" + select_qid + "_" + option_id + "_" + cnt + "' style='margin-top: 15px'>\
	    				<div class='panel-heading'>\
	    					<h3 class='panel-title'>\
	    						Sub-question\
	    						<a class='btn btn-sm pull-right' id='QQ" + select_qid + "_" + option_id + "_" + cnt + "_up' style='color: #500000; background: none; outline: 0;'\
	    						href='javascript:move_subq_up(" + select_qid + "," + option_id + "," + cnt + ")'>\
	    							<i class='fa fa-chevron-up fa-lg'/>\
	    						</a>\
	    						<a class='btn btn-sm pull-right'  id='QQ" + select_qid + "_" + option_id + "_" + cnt + "_down' style='color:#500000; background: none; outline: 0'\
	    						href='javascript:move_subq_down(" + select_qid + "," + option_id + "," + cnt + ")'>\
	    							<i class='fa fa-chevron-down fa-lg'/>\
	    						</a>\
	    					</h3>\
	    				</div>\
    					<div class='panel-body'  style='background-color:#f2dede'>\
    						<div class='form-group'>\
    							<input class='form-control' name='S" + select_qid + "_" + option_id + "_" + cnt + "[title]' value='" + input + "' required>\
    						</div>" + q_type_str + "\
    					</div>\
    				</div>\
    			</li>";
    	$("#Q" + select_qid + "_O" + option_id).before(str);	
    	hookClickSel();
    }
	
		hookClickSel();

	if (optlist != "" && optlist != undefined) {
		optionlist = optlist.split('|')
		for (i = 0; i < optionlist.length; i++) {
		  if (i==0) {
		  	orig_trigger_option_subquestion($('#S' + select_qid + '_' + option_id + '_' + cnt), select_qid, option_id, cnt, optionlist[i]);
		  }
		  else {
		  	orig_add_optionsforsub(select_qid, option_id, cnt, optionlist[i]);
		  }
		}
	}
	
}

function trigger_option_subquestion(dom_obj, select_qid, option_id, subqcnt) {
	dom_obj.after("<div id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_optdiv' class='form-group'  style='margin-top: 15px'>\
				   		<div class='panel panel-default'>\
				   			<div class='panel-heading'>Options</div>\
				   			<div class='panel-body' id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_options' style='background-color:white'>\
				   				<li id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_sub_options_list' style='margin-bottom: 15px'>\
					   				<input id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_optcnt' type='hidden' value='1'>\
					   				<div class='form-group' id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_1'>\
						   				<div class='col-xs-11' style='margin-bottom: 5px'>\
						   					<input class='form-control' name='S" + select_qid + "_" + option_id + "_" + subqcnt + "[opt1]' value='' required>\
						   				</div>\
						   				<div class='col-xs-1' style='margin-bottom: 5px'>\
						   					<a class='btn btn-danger pull-right' href='javascript:delete_optionforsub("+ select_qid + ", " + option_id + "," + subqcnt + ", 1)'>\
						   						<i class='fa fa-trash-o fa-lg'></i>\
						   					</a>\
					   					</div>\
					   				</div>\
					   			</li>\
					   			<a class='btn btn-success' id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_insertpos' href='javascript:add_optionsforsub("+ select_qid + "," + option_id + "," + subqcnt + ")' style='margin-top: 10px'>\
				   					<i class='fa fa-plus fa-lg'>\
				   					</i>\
				   					Add Option\
				   				</a>\
				   			</div>\
				   		</div>\
				   </div>");
}

function orig_trigger_option_subquestion(dom_obj, select_qid, option_id, subqcnt, input) {
	dom_obj.after("<div id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_optdiv' class='form-group'  style='margin-top: 15px'>\
				   		<div class='panel panel-default'>\
				   			<div class='panel-heading'>Options</div>\
				   			<div class='panel-body' id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_options' style='background-color:white'>\
				   				<li id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_sub_options_list' style='margin-bottom: 15px'>\
					   				<input id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_optcnt' type='hidden' value=1>\
					   				<div class='form-group' id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_1'>\
						   				<div class='col-xs-11' style='margin-bottom: 5px'>\
						   					<input class='form-control' name='S" + select_qid + "_" + option_id + "_" + subqcnt + "[opt1]' value='" + input + "' required>\
						   				</div>\
						   				<div class='col-xs-1' style='margin-bottom: 5px'>\
						   					<a class='btn btn-danger pull-right' href='javascript:delete_optionforsub("+ select_qid + ", " + option_id + "," + subqcnt + ", 1)'>\
						   						<i class='fa fa-trash-o fa-lg'></i>\
						   					</a>\
					   					</div>\
					   				</div>\
					   			</li>\
					   			<a class='btn btn-success' id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_insertpos' href='javascript:add_optionsforsub("+ select_qid + "," + option_id + "," + subqcnt + ")' style='margin-top: 10px'>\
				   					<i class='fa fa-plus fa-lg'>\
				   					</i>\
				   					Add Option\
				   				</a>\
				   			</div>\
				   		</div>\
				   </div>");
}

function trigger_option(dom_obj, select_qid, displaysub) {
	dom_obj.after("<div id='Q" + select_qid + "_optdiv' class='form-group' style='margin-top: 15px'>\
						<div class='panel panel-default'>\
							 <div class='panel-heading'>Options</div>\
							 <div class='panel-body' id='Q" + select_qid + "_options' style='background-color:white'>\
							 	<li id='Q" + select_qid + "_options_list'>\
									 <input id='Q" + select_qid + "_optcnt' type='hidden' value='3'>\
									 <div class='form-group' id='Q" + select_qid + "_1' >\
			   							<input class='form-control'  name='Q" + select_qid + "[opt1]' value='' style='margin-bottom: 15px' required>\
		   							 	<a class='btn btn-success'id='Q" + select_qid + "_O1' href='javascript:add_subquestion(" + select_qid + ", 1)'>\
   							 				<i class='fa fa-plus fa-lg'></i>\
   							 				Add Sub-question\
	   							 		</a>\
	   							 		<a class='btn btn-danger pull-right' href='javascript:delete_option(" + select_qid + ", 1)'>\
	   							 			<i class='fa fa-trash-o fa-lg'></i>\
	   							 			Delete Option\
	   							 		</a>\
   										<input id='Q" + select_qid + "_1_subqcnt' type='hidden' value='0'>\
									 </div>\
								</li>\
	   							<a class='btn btn-success' id='Q" + select_qid + "_insertpos' href='javascript:add_options("+ select_qid + ")'>\
		   							<i class='fa fa-plus fa-lg'></i>\
		   							Add Option\
	   							</a>\
							</div>\
						</div>\
					</div>");
}

function orig_trigger_option(dom_obj, select_qid, displaysub, input) {
	dom_obj.after("<div id='Q" + select_qid + "_optdiv' class='form-group' style='margin-top: 15px'>\
						<div class='panel panel-default'>\
							 <div class='panel-heading'>Options</div>\
							 <div class='panel-body' id='Q" + select_qid + "_options' style='background-color:white'>\
							 	<li id='Q" + select_qid + "_options_list'>\
									 <input id='Q" + select_qid + "_optcnt' type='hidden' value='3'>\
									 <div class='form-group' id='Q" + select_qid + "_1' >\
			   							<input class='form-control'  name='Q" + select_qid + "[opt1]' value='" + input + "' style='margin-bottom: 15px' required>\
		   							 	<a class='btn btn-success'id='Q" + select_qid + "_O1' href='javascript:add_subquestion(" + select_qid + ", 1)'>\
   							 				<i class='fa fa-plus fa-lg'></i>\
   							 				Add Sub-question\
	   							 		</a>\
	   							 		<a class='btn btn-danger pull-right' href='javascript:delete_option(" + select_qid + ", 1)'>\
	   							 			<i class='fa fa-trash-o fa-lg'></i>\
	   							 			Delete Option\
	   							 		</a>\
   										<input id='Q" + select_qid + "_1_subqcnt' type='hidden' value='0'>\
									 </div>\
								</li>\
	   							<a class='btn btn-success' id='Q" + select_qid + "_insertpos' href='javascript:add_options("+ select_qid + ")'>\
		   							<i class='fa fa-plus fa-lg'></i>\
		   							Add Option\
	   							</a>\
							</div>\
						</div>\
					</div>");
}

function hookClickSel() {
	$("select").change(function(evt){
		evt.stopImmediatePropagation();
		select_qid = $(this).attr('belong');
			switch(parseInt($(this).val())){
				case 1:
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}
					break;
				case 2:
				// checkboxes
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}
					if (select_qid.indexOf('_') == -1) 
						trigger_option($(this), select_qid, 0);
					else {
						belongarray = select_qid.split('_')
						qid = belongarray[0];
						option_id = belongarray[1];
						subqcnt = belongarray[2];
						trigger_option_subquestion($(this), qid, option_id, subqcnt);
					}
					break;
				case 3:
				// radio
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}

					if (select_qid.indexOf('_') == -1) 
						trigger_option($(this), select_qid, 1);
					else {
						belongarray = select_qid.split('_')
						qid = belongarray[0];
						option_id = belongarray[1];
						subqcnt = belongarray[2];
						trigger_option_subquestion($(this), qid, option_id, subqcnt);
					}

					break;
				case 4:
				// dropdown
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}

					if (select_qid.indexOf('_') == -1) 
						trigger_option($(this), select_qid, 1);
					else {
						belongarray = select_qid.split('_')
						qid = belongarray[0];
						option_id = belongarray[1];
						subqcnt = belongarray[2];
						trigger_option_subquestion($(this), qid, option_id, subqcnt);
					}

					break;
				default:
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}
					break;
			}


	});
}

function origClickSel(){
	$("select").change(function(evt){
		evt.stopImmediatePropagation();
		select_qid = $(this).attr('belong');
		input = $(this).attr('info');
			switch(parseInt($(this).val())){
				case 1:
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}
					break;
				case 2:
				// checkboxes
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}
					
					if (select_qid.indexOf('_') == -1) {
						if (input != "" && input != undefined) {
							optionlist = input.split('|')
							for (i = 0; i < optionlist.length; i++) {
							  if (i==0) orig_trigger_option($(this), select_qid, 1, optionlist[i]);
							  else orig_add_options(select_qid, optionlist[i]);
							}
						}
						else {
							trigger_option($(this), select_qid, 1);
						}
					}
					else {
						belongarray = select_qid.split('_')
						qid = belongarray[0];
						option_id = belongarray[1];
						subqcnt = belongarray[2];
						if (input != "" && input != undefined) {
							optionlist = input.split('|')
							for (i = 0; i < optionlist.length; i++) {
							  if (i==0) orig_trigger_option_subquestion($(this), qid, option_id, subqcnt, optionlist[i]);
							  else orig_add_optionsforsub(qid, option_id, subqcnt, optionlist[i]);
							}
						}
						else {
							trigger_option_subquestion($(this), qid, option_id, subqcnt);
						}
					}

					break;
				case 3:
				// radio
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}
					
					if (select_qid.indexOf('_') == -1) {
						if (input != "" && input != undefined) {
							optionlist = input.split('|')
							for (i = 0; i < optionlist.length; i++) {
							  if (i==0) orig_trigger_option($(this), select_qid, 1, optionlist[i]);
							  else orig_add_options(select_qid, optionlist[i]);
							}
						}
						else {
							trigger_option($(this), select_qid, 1);
						}
					}
					else {
						belongarray = select_qid.split('_')
						qid = belongarray[0];
						option_id = belongarray[1];
						subqcnt = belongarray[2];
						if (input != "" && input != undefined) {
							optionlist = input.split('|')
							for (i = 0; i < optionlist.length; i++) {
							  if (i==0) orig_trigger_option_subquestion($(this), qid, option_id, subqcnt, optionlist[i]);
							  else orig_add_optionsforsub(qid, option_id, subqcnt, optionlist[i]);
							}
						}
						else {
							trigger_option_subquestion($(this), qid, option_id, subqcnt);
						}
					}

					break;
				case 4:
				// dropdown
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}
					
					if (select_qid.indexOf('_') == -1) {
						if (input != "" && input != undefined) {
							optionlist = input.split('|')
							for (i = 0; i < optionlist.length; i++) {
							  if (i==0) orig_trigger_option($(this), select_qid, 1, optionlist[i]);
							  else orig_add_options(select_qid, optionlist[i]);
							}
						}
						else {
							trigger_option($(this), select_qid, 1);
						}
					}
					else {
						belongarray = select_qid.split('_')
						qid = belongarray[0];
						option_id = belongarray[1];
						subqcnt = belongarray[2];
						if (input != "" && input != undefined) {
							optionlist = input.split('|')
							for (i = 0; i < optionlist.length; i++) {
							  if (i==0) orig_trigger_option_subquestion($(this), qid, option_id, subqcnt, optionlist[i]);
							  else orig_add_optionsforsub(qid, option_id, subqcnt, optionlist[i]);
							}
						}
						else {
							trigger_option_subquestion($(this), qid, option_id, subqcnt);
						}
					}

					break;
				default:
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}
					break;
			}


	});
	$("select").change();
}

$(document).ready(function(){
	current_qid = parseInt($("#current_qid").val());
	origClickSel();
	finishsetup();
	setupSubs();
	$('#create_q_btn').click(function(evt){
		evt.stopImmediatePropagation();
		current_qid += 1;
		q_type_str = '<div class="form-group"  style="margin-top: 15px">\
						<div class="form-group">\
						  <label>Type</label>\
						  <select class="form-control" belong=' + current_qid + ' name="Q' + current_qid + '[type]">\
		                      <option value="1">Text</option>\
		                      <option value="2">Checkboxes</option>\
		                      <option value="3">Radio Buttons</option>\
		                      <option value="4">Dropdown</option>\
		                      <option value="5">Paragraph Text</option>\
	                	  </select>\
	                	</div>\
	                	<a class="btn btn-danger pull-right" href="javascript:delete_question(' + current_qid + ')">\
	  						<i class="fa fa-trash-o fa-lg"></i>\
	  						Delete Question\
						</a>\
					  </div>';
		$("#q_list").append("<div class='panel panel-info' id='Q" + current_qid + "'>\
								<div class='panel-heading'>\
									<h3 class='panel-title'>\
										Question\
										<a class='btn btn-sm pull-right' id='Q"+current_qid+"_up' style='color: #500000; background: none; outline: 0;'\
										href='javascript:move_q_up(" + current_qid + ")'>\
											<i class='fa fa-chevron-up fa-lg'></i>\
										</a>\
										<a class='btn btn-sm pull-right' id='Q"+current_qid+"_down' style='color: #500000; background: none; outline: 0'\
										href='javascript:move_q_down(" + current_qid + ")'>\
											<i class='fa fa-chevron-down fa-lg'></i>\
										</a>\
									</h3>\
								</div>\
								<div class='panel-body' style='background-color:#d9edf7'>\
									<div class='form-group'><input class='form-control' name='Q" + current_qid + "[title]' value='' required></div>\
									" + q_type_str+ "\
								</div>\
							</div>");
		hookClickSel();
	});

	hookClickSel();

	$(".trigger").remove();

});


function setupSubs() {
	$(".trigger").change(function(evt){
		evt.stopImmediatePropagation();
		parent_id = $(this).attr('parentid');
		parent_opt = $(this).attr('parentopt');
		sq_type = $(this).attr('selectedopt');
		sq_title = $(this).attr('title');
		sq_optlist = $(this).attr('optlist');
		//$("#trigger").remove();
		orig_add_subquestion(parent_id, parent_opt, sq_type, sq_title, sq_optlist);
		
	});
	$(".trigger").change();
}

function finishsetup() {
	$("#endtriggers").change(function(evt){
		evt.stopImmediatePropagation();
		$("select").off("change");
		
	});
	$("#endtriggers").change();
}

function move_q_up(qid){
	var current = $('#Q'+qid);
	current.prev().before(current);
}

function move_q_down(qid){
	var current = $('#Q'+qid);
	current.next().after(current);
}

function move_subq_up(qid,option,count){
	var current = $('#QQ'+qid+'_'+option+'_'+count);
	current.prev().before(current);
}

function move_subq_down(qid,option,count){
	var current = $('#QQ'+qid+'_'+option+'_'+count);
	current.next().after(current);
}


///NOTES FOR MARC ----------------------------------------------------------------------------------------------------------------------------------------------
//TAKEN FROM LINE 81 BEFORE TESTING
//<input id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_insertpos' type='button' class='btn btn-success pull-right' onclick='javascript:add_optionsforsub(" + select_qid + "," + option_id + "," + subqcnt + ");' value='Add Option' />\

//TAKEN FROM LINE 83 BEFORE TESTING
//<input id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_insertpos' type='button' class='btn btn-success pull-right' onclick='javascript:add_optionsforsub(" + select_qid + "," + option_id + "," + subqcnt + ");' value='Add Option' />\

//TAKEN FROM LINE 96 BEFORE TESTING
//<input class='btn btn-success' type='Button' onclick='javascript:add_subquestion(" + select_qid + ", 1);' value='Add Sub-question' " + vis + " />\

//TAKEN FROM LINE 107 BEFORE TESTING
//<input id='Q" + select_qid + "_insertpos' type='button' class='btn btn-success pull-right' onclick='javascript:add_options(" + select_qid + ", " + displaysub + ");' value='Add Option' />\

//ORIGINAL AND NEW FROM INSIDE LINE 39 TO CHANGE (DIFFERENCE INCLUDES DISABLING ON SELECTION OF 'CHECKBOXES')
//FROM   <input class='btn btn-success' type='Button' onclick='javascript:add_subquestion(" + select_qid + ", " + cnt + ");' value='Add Sub-question' " + vis + "/>\
//TO     <a class='btn btn-success' href='javascript:add_subquestion(" + select_qid + "," + cnt + ")'><i class='fa fa-plus fa-lg'></i> Add Sub-question</a>\

//After trigger_option_subquestion, 'add option' button brings up 'Add subquestion' button, but clicking 'Add subquestion' does not actually do anything (the 'delete option' that comes up does delete the option though)

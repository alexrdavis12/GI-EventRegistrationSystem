// This handles adding question

function checkselect() {
	$(":checkbox").change(function(evt){
		evt.stopImmediatePropagation();
		select_qid = $(this).attr('qid');
		opt = $(this).val();
		if (opt != 1) {
			iopt = parseInt(opt);
			iopt += 2;
			opt = iopt.toString()
		}
		if ($("[hash=hash_" + select_qid + "_" + opt + "]") != undefined) {
			$("[hash=hash_" + select_qid + "_" + opt + "]").hide(400);
			//$("[hash=hash_" + select_qid + "_" + opt + "]").children("").attr("disabled", true);
			if ($(this).is(":checked")) {
				$("[hash=hash_" + select_qid + "_" + opt + "]").show(400);
				$("[hash=hash_" + select_qid + "_" + opt + "]").attr("showed", select_qid);
				//$("[hash=hash_" + select_qid + "_" + opt + "]").removeAttribute("disabled");
			}
		}

	});
}

function hookselect() {
	$("select").change(function(evt){
		evt.stopImmediatePropagation();
		select_qid = $(this).attr('qid');
		opt = $(this).val();
		if (opt != 1) {
			iopt = parseInt(opt);
			iopt += 2;
			opt = iopt.toString()
		}
		if ($("[hash=hash_" + select_qid + "_" + opt + "]") != undefined) {
			$("[showed=" + select_qid + "]").hide(400);
			//$("[showed=" + select_qid + "]").prop("disabled", true);
			$("[hash=hash_" + select_qid + "_" + opt + "]").show(400);
			$("[hash=hash_" + select_qid + "_" + opt + "]").attr("showed", select_qid);
			//$("[hash=hash_" + select_qid + "_" + opt + "]").removeAttribute("disabled");
		
		}

	});
}

function radioselect() {
	$(":radio").change(function(evt){
		evt.stopImmediatePropagation();
		select_qid = $(this).attr('qid');
		opt = $(this).val();
		if (opt != 1) {
			iopt = parseInt(opt);
			iopt += 2;
			opt = iopt.toString()
		}
		if ($("[hash=hash_" + select_qid + "_" + opt + "]") != undefined) {
			$("[showed=" + select_qid + "]").hide(400);
			//$("[showed=" + select_qid + "]").prop("disabled", true);
			$("[hash=hash_" + select_qid + "_" + opt + "]").show(400);
			$("[hash=hash_" + select_qid + "_" + opt + "]").attr("showed", select_qid);
			//$("[hash=hash_" + select_qid + "_" + opt + "]").removeAttribute("disabled");
		
		}

	});
}

$(document).ready(function(){
	checkselect();
	hookselect();
	radioselect();
});

function fix_form() {
	//alert("Entered the Twilight Zone")
	
	//checkboxes are only returning last clicked as value (should return all that are checked)
	
	// $("body").find(":checkbox:hidden").prop("checked", false);
	// $("body").find(":radio:hidden").prop("checked", false);
	// $("body").find(":selected:hidden").prop("selected", false);
	// $("body").find(".form-control:hidden").val(' ');
	
	//TRYING 1 AND 5 WORKED CORRECTLY ( , 2, 3, 4, )
	//TRYING 3 RESULTED IN ( 1, 2, 3, 4, )
	//TRYING 2 RESULTED IN ( 1, 2, 3, , )
	//TRYING 2, 1, AND 5 WITH ONLY 5 SELECTED RESULTED IN ( , 2, 3, , )
	// alert("here");
	
	// $(":checkbox:hidden").prop("name", "garbage");
	// $(":radio:hidden").prop("name", "garbage");
	// $("select:hidden").prop("name", "garbage");
	// $(".form-control:hidden").prop("name", "garbage");
	
	// return true;
	
	
	//$(":checkbox:hidden").attr("exist", "false");
	//$(":radio:hidden").attr("exist", "false");
	//$("select:hidden").attr("exist", "false");
	//$(".form-control:hidden").attr("exist", "false");
	
	//$("body").find(":input:hidden").val(" ");
	//$(":input:hidden").prop("disabled", "disabled");
	alert("checkpoint");
	$(":checkbox:hidden").attr("disabled",true);
	$(":selected:hidden").attr("disabled",true);
	$(":radio:hidden").attr("disabled",true);
	$(".form-control:hidden").attr("disabled",true);
	$(".show-me").removeAttr("disabled");
	return true;
	
	// if (!($(":checkbox").is(":visible"))) {
	// 	alert($(":checkbox").val());
	// 	$(":checkbox").val("")
	// }

	// if (!($("select").is(":visible"))) {
	// 	$("select").val("")
	// }
	
	// if (!($(":radio").is(":visible"))) {
	// 	$(":radio").val("")
	// }
}
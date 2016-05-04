// This handles adding question

function checkselect() {
	$(":checkbox").change(function(evt){
		evt.stopImmediatePropagation();
		removeDisable();
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
		setupRequired();

	});
}

function hookselect() {
	$("select").change(function(evt){
		evt.stopImmediatePropagation();
		removeDisable();
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
		setupRequired();
	});
}

function radioselect() {
	$(":radio").change(function(evt){
		evt.stopImmediatePropagation();
		removeDisable();
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
		setupRequired();
	});
}

$(document).ready(function(){
	checkselect();
	hookselect();
	radioselect();
});

function setupRequired() {
	$(".form-control").attr("required", true);
	$(":radio").attr("required", true);
	
	$(".form-control:hidden").removeAttr("required");
	$(":radio:hidden").removeAttr("required");
}

function removeDisable() {
	$(":checkbox").removeAttr("disabled");
	$(":selected").removeAttr("disabled");
	$(":radio").removeAttr("disabled");
	$(".form-control").removeAttr("disabled");
}

function fix_form() {
	
	// alert("checking required fields");
	// $(".form-control").attr("required", true);
	// $(".other-input").attr("required", true);
	// $(".form-control:hidden").removeAttr("required");
	// $(".other-input:hidden").removeAttr("required");
	
	// $('[required="required"]:visible').each(function() {
	// 	if($(this).is(":not(:checked)") || $(this).is(":empty"))
	// 		alert("empty");
	// 		return false;
	// })
	
	alert("disabling hidden inputs");
	
	$(":checkbox:hidden").attr("disabled",true);
	$(":selected:hidden").attr("disabled",true);
	$(":radio:hidden").attr("disabled",true);
	$(".form-control:hidden").attr("disabled",true);
	$(".show-me").removeAttr("disabled");
	return true;
	
}
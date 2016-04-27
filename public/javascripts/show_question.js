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
			$("[hash=hash_" + select_qid + "_" + opt + "]").attr("disabled", true);
			if ($(this).is(":checked")) {
				$("[hash=hash_" + select_qid + "_" + opt + "]").show(400);
				$("[hash=hash_" + select_qid + "_" + opt + "]").attr("showed", select_qid);
				$("[hash=hash_" + select_qid + "_" + opt + "]").attr("disabled", false);
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
			$("[showed=" + select_qid + "]").attr("disabled", true);
			$("[hash=hash_" + select_qid + "_" + opt + "]").show(400);
			$("[hash=hash_" + select_qid + "_" + opt + "]").attr("showed", select_qid);
			$("[hash=hash_" + select_qid + "_" + opt + "]").attr("disabled", false);
		
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
			$("[showed=" + select_qid + "]").attr("disabled", true);
			$("[hash=hash_" + select_qid + "_" + opt + "]").show(400);
			$("[hash=hash_" + select_qid + "_" + opt + "]").attr("showed", select_qid);
			$("[hash=hash_" + select_qid + "_" + opt + "]").attr("disabled", false);
		}

	});
}

$(document).ready(function(){
	checkselect();
	hookselect();
	radioselect();
});

function fix_form() {
	alert("Entered the Twilight Zone")
	// $(":checkbox:hidden").disabled=true;
	// $("select:hidden").disabled=true;
	// $(":radio:hidden").disabled=true;
	
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
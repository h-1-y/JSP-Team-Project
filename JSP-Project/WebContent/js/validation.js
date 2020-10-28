function CheckAddMember() {
	var id = document.getElementById("id");
	var password = document.getElementById("password");
	var password_confirm = document.getElementById("password_confirm");
	var name = document.getElementById("name");
	var birthyy = document.getElementById("birthyy");
	var birthmm = document.getElementById("birthmm");
	var birthdd = document.getElementById("birthdd");
	var mail1 = document.getElementById("mail1");
	var phone = document.getElementById("phone");
	var postcode = document.getElementById("postcode");
	var address = document.getElementById("address");
	var detailAddress = document.getElementById("detailAddress");

	

	// 비밀번호 체크
	if (password.value.length < 4 || password.value.length > 12) {
		alert("[비밀번호]\n최소 4자에서 최대 12자까지 입력하세요");
		password.select();
		password.focus();
		return false;
	}

	

	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	document.newMember.submit();
}
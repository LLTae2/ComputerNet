/**
 * 
 */
function selectName() {
	var selectedName = document.getElementById('select_member');
	var memberCode = document.getElementById('member_code');
	memberCode.value = selectedName.options[selectedName.selectedIndex].value;
}
function selectLecture() {
	var selectedLecture = document.getElementById('lecture');
	selectedLecture = selectedLecture.options[selectedLecture.selectedIndex].value;
	var memberCode = document.getElementById('member_code').value;
	var price = document.getElementById('price');
	if(memberCode >= 20000) {
		selectedLecture /= 2;
	}
	price.value = selectedLecture;
}
function reset() {
	alert('정보를 지우고 처음부터 다시 입력합니다!');
}
function insertCheck() {
	if(document.frm.month.value.length == 0) {
		alert("수강월이 입력되지 않았습니다.");
		frm.month.focus();
		return false;
	}
	if(document.frm.name.value.length == 0) {
		alert("회원명 입력되지 않았습니다.");
		frm.month.focus();
		return false;
	}
	if(document.frm.code.value.length == 0) {
		alert("회원번호가 입력되지 않았습니다.");
		frm.month.focus();
		return false;
	}
	if(document.frm.place.value.length == 0) {
		alert("강의장소가 입력되지 않았습니다.");
		frm.month.focus();
		return false;
	}
	if(document.frm.lecture.value.length == 0) {
		alert("강의명이 입력되지 않았습니다.");
		frm.month.focus();
		return false;
	}
	if(document.frm.price.value.length == 0) {
		alert("수강료가 입력되지 않았습니다.");
		frm.month.focus();
		return false;
	}
	alert("회원등록이 완료 되었습니다.");
	return true;
}
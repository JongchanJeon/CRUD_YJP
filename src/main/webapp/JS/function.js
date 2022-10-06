function checkOverlapId () {
	
}

function updateCheck() {
	if(!confirm('수정하시겠습니까?'))
	{return false;}
}

function checkRRN() {
	alert("진입");
	let sum = 0;
	let count = 2;
	let lastRRN = 0;
	mem_RRN = document.getElementById("mem_RRN0").value + document.getElementById("mem_RRN1").value;
	for(let i = 0; i < 12; i++){
		if (count > 9) {
			count = 2;
		}
		sum += mem_RRN[i] * count;
		count++;
	}
	lastRRN = 11 - (sum % 11);
	if(lastRRN == 11){
		lastRRN = 1;
	}else if (lastRRN == 10) {
		lastRRN = 0;
	}
	if(mem_RRN[12] == lastRRN){
		alert("사용자 인증이 되었습니다.");
	}else {
		alert("주민등록번호가 잘 못 되었습니다.");
	}
	
}
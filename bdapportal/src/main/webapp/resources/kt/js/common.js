var Format = {
	millisecondsToTime : function(inputMss) {
		var returnVal = '';
		inputMss = new Number(inputMss);
		
		if(inputMss == 0){
			returnVal = inputMss;
		}else {
			if(inputMss >= 1000){
				var milliseconds = new Number(inputMss) % 1000;
				inputMss = inputMss / 1000;
				
				var seconds = Math.floor(inputMss % 60);
				inputMss = inputMss / 60;
				
				var minutes = Math.floor(inputMss % 60);
				inputMss = inputMss / 60;
				
				var hours = Math.floor(inputMss % 60);

				if(hours != 0){
					returnVal += hours+'시간 ';
				}
				if(minutes != 0){
					returnVal += minutes+'분 ';
				}
				if(seconds != 0){
					returnVal += seconds+'초 ';
				}
				if(milliseconds != 0){
					returnVal += milliseconds+'밀리초';
				}
			}else{
				returnVal = inputMss+'밀리초';
			}
		}
		
		return returnVal;
	},
	megaToTera : function(input) {
		var returnVal = '';
		input = new Number(input);
		
		if(input == 0){
			returnVal = input;
		}else {
			if(input >= 1000){
				var mega = new Number(input) % 1000;
				input = input / 1000;
				var giga = Math.floor(input % 1000);
				input = input / 1000;
				var tera = Math.floor(input % 1000);
				
				
				if(tera != 0){
					returnVal += tera+'TB ';
				}
				if(giga != 0){
					returnVal += giga+'GB ';
				}
				if(mega != 0){
					returnVal += mega+'MB';
				}
			}else{
				returnVal = input+'MB';
			}
		}
		
		return returnVal;
	},
	byteToTera : function(input) {
		var returnVal = '';
		input = new Number(input);
		
		if(input == 0){
			returnVal = input;
		}else {
			if(input >= 1000000){
				var byte = new Number(input) % 1000000;
				input = input / 1000000;
				var mega = Math.floor(input % 1000) ;
				input = input / 1000;
				var giga = Math.floor(input % 1000);
				input = input / 1000;
				var tera = Math.floor(input % 1000);
				
				
				if(tera != 0){
					returnVal += tera+'TB ';
				}
				if(giga != 0){
					returnVal += giga+'GB ';
				}
				if(mega != 0){
					returnVal += mega+'MB ';
				}
				if(byte != 0){
					returnVal += byte+'Byte';
				}
			}else{
				returnVal = input+'Byte';
			}
		}
		
		return returnVal;
	},
	resultToString : function(result) {
		var returnVal = '';
		if(result == 'SUCCEEDED'){
			returnVal = '성공';
		}else if(result == 'RUNNING'){
			returnVal = '수행중';
		}else if(result == 'FAIL'){
			returnVal = '실패';
		}
		
		return returnVal;
	},
	tblCntToString : function(input) {
		var returnVal = '';
		inputMss = new Number(input);
		console.log(input);
		if(inputMss == 0){
			returnVal = input;
		}else {
			if(inputMss >= 1000){
				var cheon = new Number(input) % 100000;
				input = input / 100000;
				var man = Math.floor(input % 10) ;
				input = input / 10;
				var eok = Math.floor(input % 1000);
				if(eok != 0){
					returnVal += eok+'억 ';
					console.log(returnVal);
				}
				if(man != 0){
					returnVal += man+'만 ';
					console.log(returnVal);
				}
				if(cheon != 0){
					returnVal += cheon+'천';
					console.log(returnVal);
				}
			}else{
				returnVal = input;
				console.log(returnVal);
			}
		}
		
		return returnVal;
	}
};


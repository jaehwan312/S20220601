var httpRequest = null;
function getHttpRequest() {
	if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e1) {
				return null;
			}
		}
	} else {
		try {
			return new XMLHttpRequest();
		} catch (e3) {
			return null;
		}
	}
}
function sendRequest(url, params, callback, method) {
	httpRequest = getHttpRequest();
	var httpMethod = method ? method : 'GET';
	if (httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';
	}
	var httpParams = (params == null || params == '') ? null : params;
	var httpUrl = url;
	if (httpMethod == 'GET' && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.setRequestHeader('Content-Type',
			'application/x-www-form-urlencoded');
	httpRequest.onreadystatechange = callback;
	httpRequest.send(httpMethod == 'POST' ? httpParams : null);
}
function log(msg) {
	var con = document.getElementById("console");
	if (msg != null) {
		con.innerHTML += msg + "<br>";
	}
}
$(document).ready(function() {
		
		// 검색 분류 선택
		$("#search-kind").change(function() {
			var kind = $("#search-kind").val();
			$("#search-kind option").removeAttr('selected');
			$("#search-kind option[value="+kind+"]").attr('selected', 'selected');
			$("#search-text").text("").val("");
		});

		$("#search-text").keyup(function() {
			// 사람 검색
			if ($("#search-kind").val() == "search-user") {
				$.ajax({
					url: "searchUser",
					type:"GET",
					data:{searchText : $("#search-text").val()},
					dataType:"html",
					context:document.body,
					success:function(data) {
						$("#search-list").html(data);
					},
					error:function(request, status, error){
						$("#search-list").html("searchText : " + $("#search-text").val() + "\n code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
			// 해시태그 검색
			if ($("#search-kind").val() == "search-hash") {
				$.ajax({
					url: "searchHash",
					type:"GET",
					data:{searchText : $("#search-text").val()},
					dataType:"html",
					context:document.body,
					success:function(data) {
						$("#search-list").html(data);
					},
					error:function(request, status, error){
						$("#search-list").html("searchText : " + $("#search-text").val() + "\n code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
			// 장소 검색
			if ($("#search-kind").val() == "search-loc") {
				$.ajax({
					url: "searchLoc",
					type:"GET",
					data:{searchText : $("#search-text").val()},
					dataType:"html",
					context:document.body,
					success:function(data) {
						$("#search-list").html(data);
					},
					error:function(request, status, error){
						$("#search-list").html("searchText : " + $("#search-text").val() + "\n code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
			// 검색결과창 사라지기1
			if ($("#search-text").val() == "") {
				$("#search-list").css("display", "none");
			} else {
				$("#search-list").css("display", "block");
			}
		});
		
		// 검색결과창 사라지기2
		$("#search-text").focusout(function() {
			$("#search-list").css("display", "none");
		}).focusin(function() {
			$("#search-list").css("display", "block");
		});

	});
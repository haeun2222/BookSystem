function getAllUsers() {
	var userList = $("<table id='userList'>").append(
			$("<tr>").append(
				"<th>회원번호</th>",
		        "<th>회원이메일</th>",
		        "<th>회원이름</th>",
		        "<th>전화번호</th>",
		        "<th>회원생일</th>",
		        "<th>가입일</th>",
		        "<th>성별</th>"	
			)
	);		
	
    $.get("./getAllUser.do", function(getAllusers) { 
        $.each(getAllusers, function(index, user) {
            userList.append(
            	$("<tr>").append(
            	"<td>"+ user.user_seq + "</td>",
            	"<td>"+ user.user_email + "</td>",
            	"<td>"+ user.user_name + "</td>",
            	"<td>"+ user.user_phone + "</td>",
            	"<td>"+ user.user_birth + "</td>",
            	"<td>"+ user.joindate + "</td>",
            	"<td>"+ user.user_gender + "</td>"
            	)
            );
        });
    });
    $("#userList").remove();
    $("#userInfoTable").append(userList);
    
    if ($("#bookinfoTable").length) {
        $("#bookinfoTable").remove();
    }
}
$(document).ready(function() {
    $("#userTableButton").click(function() {
        toggleUserTable();
    });

    $("#bookTableButton").click(function() {
        toggleBookTable();
    });

    $("#rentListButton").click(function() {
        toggleRentTable();
    });
    
    hideUserTable();
    hideBookTable();
    hideBookSearchTable();
    hideRentTable();
});

function clearTable() {
    $("#userInfoTable").empty(); // 회원 테이블 내용 삭제
    $("#bookInfoTable").empty(); // 도서 테이블 내용 삭제
    $("#bookSearchTable").empty(); // 도서 테이블 내용 삭제
    $("#rentListTable").empty();
}


var isRentTableVisible = false;

function toggleRentTable(){
    isRentTableVisible = !isRentTableVisible;
    if (isRentTableVisible) {
        getAllRent();
        hideUserTable();
        hideBookTable();
        hideBookSearchTable();
        $("#rentListTable").show();
    } else {
        hideRentTable();
    }
}

function getAllRent() {
    $.get("./adminRentList.do", function(data) {
        var rentList = data.lists; // 서버에서 전달한 JSON 데이터
        var tableHtml = "<table border='1'><tr><th>No.</th><th>사용자 이름</th><th>도서 제목</th><th>대출일</th><th>반납예정일</th><th>대출 상태</th><th>처리</th><th>운송장</th></tr>";

        for (var i = 0; i < rentList.length; i++) {
            var rent = rentList[i];
            tableHtml += "<tr>";
            tableHtml += "<td>" + (i + 1) + "</td>";
            tableHtml += "<td>" + rent.USER_NAME + "</td>";
            tableHtml += "<td>" + rent.BOOK_TITLE + "</td>";
            tableHtml += "<td>" + rent.RENT_DATE + "</td>";
            tableHtml += "<td>" + rent.RENT_RETURN_DATE + "</td>";
            tableHtml += "<td>" + rent.RENT_STATUS + "</td>";
            tableHtml += "<td><button onclick='handleReturnConfirmation(" + rent.RENT_SEQ + ", " + rent.BOOK_SEQ + ")'>반납확인</button></td>";
            tableHtml += "<td><input type='text' id='deliveryNum" + rent.USER_SEQ + "' placeholder='운송장번호 입력' value=''>" +
                         "<button onclick='updateDelivery(" + rent.USER_SEQ + ", \"" + rent.USER_SEQ + ".delivery_num\")'>입력</button></td>";
            tableHtml += "</tr>";
        }

        tableHtml += "</table>";
        $("#rentListTable").html(tableHtml);
    });
}


function hideRentTable(){
	$("#rentListTable").empty();
}


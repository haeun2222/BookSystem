/*링크연결하기*/
var userName = document.getElementById('userName').value;
var bookTitle = document.getElementById('bookTitle').value;
var rentDate = document.getElementById('rentDate').value;
var rentReturnDate = document.getElementById('rentReturnDate').value;
var rentSeq = document.getElementById('rentSeq').value;
var userSeq = document.getElementById('userSeq').value;
var bookSeq = document.getElementById('bookSeq').value;
var rentStatus = document.getElementById('rentStatus').value;

function toggleRentTable(){
	
}




function getAllRent() {
    $("#bookInfoTable").hide();
    $("#userInfoTable").hide();
    $("#rentInfoTable").show();
    
    $.get("./adminRentList.do", function (data) {
        var rentList = $("<table id='rentList'>").append(
            $("<tr>").append(
                "<th>No.</th>",
                "<th>회원 이름</th>",
                "<th>도서명</th>",
                "<th>대출일</th>",
                "<th>반납예정일</th>",
                "<th>대출상태</th>",
                "<th>처리</th>",
                "<th>운송장</th>"
            )
        );

        $.each(data.lists, function (index, rent) {
            var status = index + 1;
            var rentStatusText = "";

            switch (rentStatus) {
                case 'Y':
                    rentStatusText = "대출중";
                    break;
                case 'N':
                    rentStatusText = "반납완료";
                    break;
                case 'A':
                    rentStatusText = "대출 배송완료";
                    break;
                case 'B':
                    rentStatusText = "반납 배송완료";
                    break;
                default:
                    rentStatusText = "알 수 없음";
                    break;
            }

            var row = $("<tr>").append(
                $("<td>").text(status),
                $("<td>").text(userName),
                $("<td>").text(bookTitle),
                $("<td>").text(rentDate),
                $("<td>").text(rentReturnDate),
                $("<td>").text(rentStatusText),
                $("<td>").html(
                    rentStatus == 'B' ? 
                    "<button onclick='handleActions(" + rentSeq + "," + bookSeq + ")' style='color: #263238'>반납확인</button>" :
                    ""
                ),
                $("<td>").html(
                    rentStatus == 'B' ?
                    "<input type='text' id='deliveryNum" + userSeq + "' placeholder='운송장번호 입력' value=''>" +
                    "<button onclick='updateDelivery(" + userSeq + ", \"" + userSeq + ".delivery_num\")' style='color: #263238'>입력</button>" :
                    ""
                )
            );

            rentList.append(row);
        });

        // 도서 대출 목록 테이블을 화면에 추가
        $("#rentInfoTable").html(rentList);
    });
}



function hideRnetTable(){
	$("#bookrentTable").empty();
}


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

var isRentTableVisible = false;

function clearTable() {
    $("#userInfoTable").empty(); // 회원 테이블 내용 삭제
    $("#bookInfoTable").empty(); // 도서 테이블 내용 삭제
    $("#bookSearchTable").empty(); // 도서 테이블 내용 삭제
    $("#rentListTable").empty();
}



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
	$("#userInfoTable").hide();
	$("#bookInfoTable").hide();
	$("#rentListTable").show();
    $.get("./adminRentList.do", function(data) {
        var rentList = data.lists; // 서버에서 전달한 JSON 데이터
        var tableHtml = "<table border='1'><tr><th>No.</th><th>사용자 이름</th><th>도서 제목</th><th>대출일</th><th>반납예정일</th><th>대출 상태</th><th>처리</th><th>운송장</th></tr>";

        for (var i = 0; i < rentList.length; i++) {
            var rent = rentList[i];
            tableHtml += "<tr>";
            tableHtml += "<td>" + (i + 1) + "</td>";
            tableHtml += "<td>" + rent.USER_NAME + "</td>";
            tableHtml += "<td>" + rent.BOOK_TITLE + "</td>";
            tableHtml += "<td>" + formatDate(rent.RENT_DATE) + "</td>"; // 대출일 형식 변환
     		tableHtml += "<td>" + formatDate(rent.RENT_RETURN_DATE) + "</td>"; // 반납예정일 형식 변환
            tableHtml += "<td>";
	        // rent status에 따라 상태를 표시
	        if (rent.RENT_STATUS == 'Y') {
	            tableHtml += "대출중";
	        } else if (rent.RENT_STATUS == 'N') {
	            tableHtml += "반납완료";
	        } else if (rent.RENT_STATUS == 'A') {
	            tableHtml += "대출 배송완료";
	        } else if (rent.RENT_STATUS == 'B') {
	            tableHtml += "반납 배송완료";
	        }
	        tableHtml += "</td>";
            // rent status가 "B"인 경우에만 반납확인 버튼을 표시
            if (rent.RENT_STATUS == "B") {
                tableHtml += "<td><button onclick='handleActions(" + rent.RENT_SEQ + ", " + rent.BOOK_SEQ + ")'>반납확인</button></td>";
            } else {
                tableHtml += "<td></td>"; // 아닌 경우 빈 칸으로 처리
            }
            tableHtml += "<td><input type='text' id='deliveryNum" + rent.USER_SEQ + "' placeholder='운송장번호 입력' value=''>" +
                         "<button onclick='updateDelivery(" + rent.USER_SEQ + ", \"" + rent.USER_SEQ + ".delivery_num\")'>입력</button></td>";
            tableHtml += "</tr>";
        }

        tableHtml += "</table>";
        $("#rentListTable").html(tableHtml);
    });
}

function formatDate(dateString) {
    var date = new Date(dateString);
    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 2자리로 포맷
    var day = date.getDate().toString().padStart(2, '0'); // 일자를 2자리로 포맷
    return year + "." + month + "." + day;
}

async function handleActions(rentSeq, bookSeq) {
    try {
        const confirmResponse = await $.ajax({
            type: "POST",
            url: "./confirmReturn.do",
            data: { rentSeq: rentSeq }
        });

        if (confirmResponse == "success") {
            alert("반납확인 완료");
        } else {
            alert("반납확인 실패");
        }
        const rentStandbyResponse = await $.ajax({
            type: "POST",
            url: "./rentStandby.do",
            data: { bookSeq: bookSeq }
        });

        if (rentStandbyResponse == "success") {
            alert("해당도서의 예약회원의 상태가 대출대기로 변경되었습니다.");
        } else {
            alert("해당도서는 예약건이 없어 예약상태변경이 진행되지 않습니다.");
        }
        location.reload();
    } catch (error) {
        console.error("오류 발생: " + error);
        alert("요청을 처리하는 동안 오류가 발생했습니다.");
    }
}


// JavaScript 파일에서 운송장 번호 업데이트 함수 정의
function updateDelivery(userSeq, deliveryNum) {
 
    const deliveryNumValue = document.getElementById(`deliveryNum${userSeq}`).value;

    // AJAX를 사용하여 서버에 업데이트 요청을 보냄
    $.ajax({
        url: './updateDeliveryNum.do',
        type: 'POST', // 업데이트 요청의 HTTP
        data: {
            user_seq: userSeq,
            delivery_num: deliveryNumValue // 가져온 운송장 번호 사용
        },
        success: function(response) {
            alert('운송장 번호가 업데이트되었습니다.');
        },
        error: function(error) {
            // 업데이트가 실패한 경우 처리할 내용을 여기에 추가하세요.
            alert('운송장 번호 업데이트 중 오류가 발생했습니다.');
        }
    });
}


function hideRentTable(){
	$("#rentListTable").empty();
}


$(document).ready(function(){
    $("#search").click(function(){
        $.ajax({
            method: "GET",
            url: "https://dapi.kakao.com/v3/search/book?target=title",
            data: { query: $("#bookName").val() },
            headers: { "Authorization": "KakaoAK deebb5b9fe3604c7cbb30baeb31b856e" }
        })
        .done(function(res){
            var table = $(".book-table tbody");
            table.empty();

            for (var i = 0; i <= 4 && i < res.documents.length; i++) {
                var rowData = res.documents[i];
                var row = '<tr>';
                row += '<td><img src="' + rowData.thumbnail + '" /></td>';
                row += '<td>' + rowData.title + '</td>';
                row += '<td>' + rowData.contents + '</td>';
                row += '<td>' + rowData.authors + '</td>';
                row += '<td>' + rowData.publisher + '</td>';
                row += '<td><button>등록하기</button></td>';
                row += '</tr>';
                table.append(row);
            }
        });
    });
});


function getAllBooks() {
	console.log("test");
	var bookList = $("<table id='bookList'>").append(
			$("<tr>").append(
				"<th>도서번호</th>",
		        "<th>도서이미지</th>",
		        "<th>도서제목</th>",
		        "<th>저자명</th>",
		        "<th>도서 ISBN</th>",
		        "<th>출판사</th>",
		        "<th>출판일</th>"
			)
	);		
    $.get("./getAllBooks.do", function(getAllBooks) { 
        $.each(getAllBooks, function(index, book) {
            bookList.append(
            	$("<tr>").append(
            	"<td>"+ book.book_seq + "</td>",
            	"<td>"+ book.book_img + "</td>",
            	"<td>"+ book.book_title + "</td>",
            	"<td>"+ book.book_writer + "</td>",
            	"<td>"+ book.book_isbn + "</td>",
            	"<td>"+ book.book_publisher + "</td>",
            	"<td>"+ book.book_published_date + "</td>"
            	)
            );
        });
    });
    $("#bookList").remove();
    $("#bookinfoTable").append(bookList);
   
    if ($("#userInfoTable").length) {
        $("#userInfoTable").remove();
    }
}


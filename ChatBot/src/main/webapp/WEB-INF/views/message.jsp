<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>
/* 노말라이징 */
body, ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

/* 라이브러리 */
.con {
	max-width: 1000px;
	margin: 0 auto;
}

/* 커스텀 */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

body {
	font-family: 'Noto Sans KR', sans-serif;
	overflow-y: hidden;
}

body, html {
	height: 100%;
}

#chat-room {
	height: 100%;
	background-color: #6884b3;
	/* 임시 */
	outline: 2px solid black;
	position: relative;
}

#chat-room .message-box {
	padding: 0 0.7rem;
	overflow-y: scroll;
	height: calc(100% - 4.4rem);
}

#chat-room .message-group::before {
	content: attr(data-date-str);
	display: block;
	background-color: rgba(0, 0, 0, 0.15);
	border-radius: 1rem;
	text-align: center;
	padding: 0.3rem 0;
	color: white;
	font-size: 1.6rem;
}

#chat-room .chat-message {
	margin-left: 3rem;
	position: relative;
}

#chat-room .chat-message>section {
	position: absolute;
	top: 0;
	left: -3rem;
}

#chat-room .chat-message>span {
	display: block;
}

#chat-room .chat-message>section {
	font-size: 3rem;
}

#chat-room .chat-message::after {
	content: "";
	display: block;
	clear: both;
}

#chat-room .chat-message>div {
	background-color: white;
	float: left;
	padding: 0.8rem;
	border-radius: 1rem;
	clear: both;
	font-weight: bold;
	font-size: 1.46rem;
	box-shadow: 1px 1px 0 rgba(0, 0, 0, 0.3);
}

#chat-room .chat-message.mine>div {
	background-color: #FDF01B;
	float: right;
	box-shadow: -1px 1px 0 rgba(0, 0, 0, 0.3);
}

#chat-room .chat-message.mine>span {
	display: none;
}

#chat-room .chat-message.mine>section {
	display: none;
}

#chat-room .input-box {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
}

#chat-room .input-box #text-input {
	width: 100%;
	display: block;
	border: 0;
	outline: none;
	padding-right: 8.5rem;
	padding-left: 4.8rem;
	padding-top: 0.1rem;
	font-size: 1.4rem;
	line-height: 4rem;
	font-weight: bold;
	box-sizing: border-box;
}

#chat-room .input-box .btn-plus {
	position: absolute;
	top: 0;
	left: 0;
	width: 4rem;
	height: 100%;
	background-color: #D1D1D1;
}

#chat-room .input-box .btn-plus>i {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translateX(-50%) translateY(-45%);
	color: white;
	font-size: 3rem;
}

#chat-room .input-box .btn-submit {
	position: absolute;
	right: 1rem;
	top: 50%;
	transform: translateY(-50%);
	padding: 10px;
	background-color: #fdf01b;
	padding: 10px;
	color: #bfb73d;
	border-radius: 3px;
	font-size: 1.3rem;
	box-shadow: 0 1px 10px rgba(0, 0, 0, 0.2);
	user-select: none;
}

#chat-room .input-box .btn-emo {
	position: absolute;
	right: 6rem;
	top: 50%;
	transform: translateY(-50%);
	font-size: 2rem;
	color: #CBCBCB;
	user-select: none;
}
</style>

<script>
var k = function() {
    // val()은 엘리먼트가 가지고 있는 value 속성의 값을 가져온다.
    var message = $('#chat-room .input-box #text-input').val();
    
    // 메세지 변수에 들어있는 값이 ''와 같다면
    if ( message == '' ) {
        // 함수를 더 이상 진행시키지 않고 여기서 종료시킨다.
        return false;
    }
    
    var html = `
    <div class="chat-message mine">
        <section><i class="fa fa-user"></i></section>
        <span>홍길동</span>
        <div>${message}</div>
    </div>
    `;
    
    $('#chat-room .message-group:last-child').append(html);
    
    // val(문자열)은 엘리먼트가 가지고 있는 value 속성의 값을 입력받은 문자열로 교체하라는 뜻입니다.
    $('#chat-room .input-box #text-input').val('');
};

$('#chat-room .input-box .btn-submit').click(k);

// input 창에서 키보드 눌림 이벤트 발생시 함수를 실행하도록 예약
$('#chat-room .input-box #text-input').keydown(function(e) {
    // 만약 입력한 키코드가 13, 즉 엔터라면 함수를 실행한다.
    if ( e.keyCode == 13 ) {
        k();
    }
});

</script>


<body>
	<!-- 모바일에서 디바이스의 해상도가 아닌 디바이스의 실제 크기를 기준으로 너비/높이를 잡는다. -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<h1 style="display: none;">완료 요구사항 : 메세지 박스의 스크롤바는 입력박스 바로 위까지만
		위치해야 합니다.</h1>
	<h1 style="display: none;">다음 요구사항 : 스크롤바를 디자인 해주세요.</h1>

	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<div id="chat-room">
		<div class="message-box">
			
			
			<div class="message-group" data-date-str="2022-08-10">
			
			<c:forEach var="records" items="${records}">

				


					<c:choose>

						<c:when test="${records.identity == 0}">
							<div class="chat-message mine">
								<section>
									<i class="fa fa-user"></i>
								</section>
								<span>홍길동</span>
								<div>${records.comment}</div>
							</div>


						</c:when>
						<c:otherwise>

							<div class="chat-message other">
								<section>
									<i class="fa fa-user"></i>
								</section>
								<span>AI</span>
								<div>${records.comment}</div>
							</div>


						</c:otherwise>
					</c:choose>
				



			</c:forEach>
			
			</div>

		</div>
		<form method='post'>
			<div class="input-box">
				<input type="hidden" name='userid' value='${userId}' /> <input
					type="text" name='comment' id="text-input" />
				<div class="btn-plus">
					<i class="fa fa-plus" aria-hidden="true"></i>
				</div>
				<div class="btn-emo">
					<i class="fa fa-smile-o" aria-hidden="true"></i>
				</div>
				<div>
					<input class="btn-submit" formaction='/home/addComment' id="submit"
						type="submit" style="color: black" value="전송" />
				</div>
			</div>
		</form>
	</div>

</body>
</html>
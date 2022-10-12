<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제내역</title>
    <link href="css/transaction.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
    <!-- 결제 내역을 모르는데 어떻게 출력함?(해야됨) -->
    <div class="column transaction">
        <section class="transaction_section">
        <div class="row">
            <a href="" class="transaction_back"><svg width="20px" height="20px" viewBox="0 0 24 24"><path fill="#888888" fill-rule="evenodd" d="M16.41 5.41L15 4l-8 8 8 8 1.41-1.41L9.83 12z"></path></svg></a> 
            <div class="column">
                <span class="transaction_style1">결제내역</span>
                <span class="transaction_style2">아래 항목을 클릭하여 자세한 이용내역을 확인하실 수 있습니다.</span>
            </div>
        
        </div>

        <table>
            <thead>
            <tr style="font-weight:bold; font-size:12px;">
                <th>결제일</th>
                <th>항목</th>
                <th>총금액</th>
                <th>크래딧 내역</th>
                <th>크래딧 잔액</th>
                <th>결제금액</th>
                <th>결제상태</th>
                <th>영수증</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                <td colspan="8">    
                    <div class="column" style="align-items:center; text-align:center;">
                        <svg width="72px" height="72px" viewBox="0 0 24 24"><path fill="#e1e1e1" fill-rule="evenodd" d="M12 22l-2-1.5L8 22l-2-1.5L4 22V2l2 1.5L8 2l2 1.5L12 2l2 1.5L16 2l2 1.5L20 2v20l-2-1.5-2 1.5-2-1.5-2 1.5zm2-5.5V15H7v1.5h7zm3-4V11H7v1.5h10zm0-4V7H7v1.5h10z"></path></svg>
                        <p class="transaction_style2">결제내역이 없습니다.<br/>
                            월간 요금제는 후불 결제이며,<br/>
                            결제 이후에 내역을 확인하실 수 있습니다.
                        </p>
                    </div>
                </td>
                </tr>
            </tbody>

        </table>

        </section>


    </div>
</body>
</html>
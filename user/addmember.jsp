﻿<!-- Step 0: import library --><%@ page import = "java.sql.*, java.util.*"%><%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%><html><head><title>加入會員</title></head><body><%try {//Step 1: 載入資料庫驅動程式     Class.forName("com.mysql.jdbc.Driver");    try {//Step 2: 建立連線 	        String url="jdbc:mysql://localhost";                String sql="";        Connection con=DriverManager.getConnection(url,"root","1234");        if(con.isClosed())           out.println("連線建立失敗");        else {//Step 3: 選擇資料庫              sql="use demo";           con.createStatement().execute(sql);           //從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1")編碼           		   String new_id=request.getParameter("id");		   String new_pwd=request.getParameter("pwd");       String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");		   String new_tel=request.getParameter("tel");		   String new_address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");		   String new_email=request.getParameter("email");		   		   		   //Step 4: 執行 SQL 指令	           sql="insert member (id, pwd, name, tel, address, email) ";           sql+="value ('" + new_id + "', ";           sql+="'"+new_pwd+"', ";           sql+="'"+new_name+"', ";           sql+="'"+new_tel+"', ";           sql+="'"+new_address+"', ";    		              sql+="'"+new_email+"')";      //out.println(sql);           con.createStatement().execute(sql);//Step 6: 關閉連線           con.close();//Step 5: 顯示結果          //直接顯示最新的資料           response.sendRedirect("loginpage.jsp");       }    }    catch (SQLException sExec) {           out.println("SQL錯誤"+sExec.toString());    }}catch (ClassNotFoundException err) {   out.println("class錯誤"+err.toString());}%></body></html>
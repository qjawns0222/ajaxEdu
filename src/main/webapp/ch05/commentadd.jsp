<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.sql.SQLException"%>
<%@page import="util.DB"%>
<%@page import="util.Util"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String name=request.getParameter("name");
String content=request.getParameter("content");
System.out.println(name);
Connection conn=null;
Statement stmtIdSelect=null;
ResultSet rsIdSelect=null;
PreparedStatement pstmtIdUpdate=null;
PreparedStatement pstmtCommentInsert=null;
try{
	int nextId=0;
	conn=DB.getConnection();
	System.out.println(conn);
	conn.setAutoCommit(false);
	stmtIdSelect=conn.createStatement();
	rsIdSelect=stmtIdSelect.executeQuery("select max(id) from tablement");
	if(rsIdSelect.next()){
		nextId=rsIdSelect.getInt(1);	
	}
	nextId++;
	pstmtCommentInsert = conn.prepareStatement("insert into tablement values(?,?,?)");
	pstmtCommentInsert.setInt(1,nextId);
	pstmtCommentInsert.setString(2,name);
	pstmtCommentInsert.setString(3,content);
	pstmtCommentInsert.executeUpdate();
	conn.commit();
%>
<result>
<code>success</code>
<data><![CDATA[{
id:<%=nextId%>,
name:'<%=Util.toJS(name)%>',
content:'<%=Util.toJS(content)%>'
}]]>
</data>
</result>
<%
}catch(Throwable e){
	try{conn.rollback();}catch(SQLException ex){}

%>

<result>
<code>error</code>
<message><![CDATA[<%=e.getMessage()%>]]></message>

</result>
<%}finally{
	if(rsIdSelect!=null)try{rsIdSelect.close();}catch(SQLException e){}
	if(stmtIdSelect!=null)try{stmtIdSelect.close();}catch(SQLException e){}
	if(pstmtIdUpdate!=null)try{pstmtIdUpdate.close();}catch(SQLException e){}
	if(pstmtCommentInsert!=null)try{pstmtCommentInsert.close();}catch(SQLException e){}
	if(conn!=null)try{conn.close();}catch(SQLException e){}
} %>

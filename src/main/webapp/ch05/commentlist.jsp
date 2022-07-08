<?xml version="1.0" encoding="utf-8" ?>
<%@page import="java.sql.SQLException"%>
<%@page import="util.DB"%>
<%@page import="util.Util"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
try{
	conn=DB.getConnection();
	stmt=conn.createStatement();
	rs=stmt.executeQuery("select * from tablement order by ID");

%>
<result><code>success</code><data><![CDATA[[
<%
if(rs.next()){
	do{
		if(rs.getRow()>1){%>
		,	
<%
		}
%>
		{
			id:<%=rs.getInt("ID")%>,
			name:'<%=Util.toJS(rs.getString("NAME"))%>',
			content:'<%=Util.toJS(rs.getString("CONTENT"))%>'}
			<%
	}while(rs.next());
}
%>
]]]></data></result>
<%}catch(Throwable e){
	out.clearBuffer();
%>
<result>
<code>error</code>
<message><![CDATA[<%= e.getMessage() %>]]></message>
</result>
<%}finally{
	if(rs!=null)try{rs.close();}catch(SQLException e){}
	if(stmt!=null)try{stmt.close();}catch(SQLException e){}
	if(conn!=null)try{conn.close();}catch(SQLException e){}
} %>





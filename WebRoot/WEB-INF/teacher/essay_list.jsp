<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="bean.t_essay" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    </head>
  
  <body>
  <%
    int i=0;
    ArrayList<t_essay> essay=null;
    try{
    essay= (ArrayList<t_essay>)session.getAttribute("essay_list") ;
    }
    catch(Exception e){}
   %>
   <center>
   <table  border="1" width="550" style="text-align:center;align:center;">
   
   <%for(i=0;i<essay.size();i++){ %>
   <tr>
 <%int t_id=essay.get(i).getT_id(); 
   int essay_id=essay.get(i).getEssay_id();
   %>
   <td><%out.print("<a href=\"essay_content.action?t_id="+t_id+"&essay_id="+essay_id+"\">"); 
 out.print(essay.get(i).getTitle()); 
   out.print("</a>");
   
   %></td>
   <td>发布时间为:<%out.print(essay.get(i).getDatetime().toLocaleString()); %></td>
   </tr>
   <%} %>
    </table>
    </center>
    <br>
    <br>
    
     <%
  
    ArrayList<Integer> l=null;
    try{
    l= (ArrayList<Integer>)session.getAttribute("totalpage") ;
   request.setAttribute("categories",l);
    }
    catch(Exception e){}
   %>
    <div style="align:bottom;text-align:center;">
 <s:iterator var="index" value="#request.categories">
 <a href="essay_list.action?&currentpage=<s:property value="#index"/>">
 <s:property value="#index"/>
 </a>&nbsp;
 
  </s:iterator>
  </div>
  </body>
</html>

<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 011 10-11
  Time: 下午 6:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑通讯人信息</title>
</head>
<body>
    <jsp:useBean id="conn" class="com.jdbc.Conn"></jsp:useBean>
    <%
        request.setCharacterEncoding("utf-8");
        String fId = request.getParameter("fId");
        String sql = "select * from friend where id='"+fId+"'";
        ResultSet rs = conn.executeQuery(sql);
        rs.next();
        String id = rs.getString(1);
        String name = rs.getString(2);
        String phone = rs.getString(3);
        String address = rs.getString(4);
    %>

    <form method="post" name="addForm" action="index.jsp?action=modify">
        <input type="hidden" name="modifyId" value="<%=fId%>">
        <table cellpadding="10px" cellspacing="0" border="1px" align="center" width="800px">
            <tr>
                <th colspan="2">编辑通讯人</th>
            </tr>
            <tr>
                <td>序号</td>
                <td><input type="text" value="<%=id%>" disabled></td>
            </tr>
            <tr>
                <td>姓名</td>
                <td><input type="text" name="modifyName" value="<%=name%>"></td>
            </tr>
            <tr>
                <td>电话</td>
                <td><input type="text" name="modifyTel" value="<%=phone%>"></td>
            </tr>
            <tr>
                <td>地址</td>
                <td><input type="text" name="modifyAdd" value="<%=address%>"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="修改">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

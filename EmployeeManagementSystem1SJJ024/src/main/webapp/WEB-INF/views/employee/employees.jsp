<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>员工列表 - 员工管理系统</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Microsoft YaHei', Arial, sans-serif;
            background-color: #f5f5f5;
            line-height: 1.6;
        }
        .header {
            background: white;
            padding: 1rem 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-bottom: 1px solid #e1e5e9;
        }
        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header-title {
            font-size: 1.5rem;
            color: #333;
        }
        .btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }
        .btn-outline {
            background: transparent;
            color: #667eea;
            border: 1px solid #667eea;
        }
        .main-content {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        .table-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .table-header {
            padding: 1.5rem;
            border-bottom: 1px solid #e1e5e9;
        }
        .table-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #e1e5e9;
        }
        th {
            background-color: #f8f9fa;
            font-weight: 600;
            color: #333;
        }
        tr:hover {
            background-color: #f8f9fa;
        }
        .empty-state {
            text-align: center;
            padding: 3rem;
            color: #666;
        }
    </style>
</head>
<body>
<header class="header">
    <div class="header-content">
        <h1 class="header-title">👥 员工列表</h1>
        <a href="<c:url value='/employee/dashboard'/>" class="btn btn-outline">返回工作台</a>
    </div>
</header>

<main class="main-content">
    <div class="table-container">
        <div class="table-header">
            <div class="table-title">公司员工信息 (共 ${employees.size()} 人)</div>
        </div>

        <c:choose>
            <c:when test="${not empty employees}">
                <table>
                    <thead>
                    <tr>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>职位</th>
                        <th>联系方式</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="employee" items="${employees}">
                        <tr>
                            <td>${employee.name}</td>
                            <td>${employee.gender}</td>
                            <td>${employee.position}</td>
                            <td>${employee.contact}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <h3>暂无员工数据</h3>
                    <p>系统中还没有员工信息</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>

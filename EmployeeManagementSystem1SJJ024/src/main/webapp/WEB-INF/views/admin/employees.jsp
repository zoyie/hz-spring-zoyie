<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>员工管理 - 员工管理系统</title>
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
        .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        .main-content {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }
        .search-form {
            display: flex;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }
        .search-input {
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            flex-grow: 1;
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
        .actions {
            display: flex;
            gap: 0.5rem;
        }
        .btn-sm {
            padding: 0.3rem 0.8rem;
            font-size: 0.8rem;
        }
        .btn-edit {
            background: #28a745;
            color: white;
        }
        .btn-delete {
            background: #dc3545;
            color: white;
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
        <h1 class="header-title">👥 员工管理</h1>
        <a href="<c:url value='/admin/dashboard'/>" class="btn btn-outline">返回控制台</a>
    </div>
</header>

<main class="main-content">
    <div class="content-header">
        <h2>员工列表</h2>
        <a href="<c:url value='/admin/employees/add'/>" class="btn btn-primary">➕ 添加员工</a>
    </div>

    <div class="search-form">
        <form action="<c:url value='/admin/employees/search'/>" method="get">
            <input type="text" name="id" class="search-input" placeholder="输入员工ID进行查询">
            <button type="submit" class="btn btn-outline">查询</button>
        </form>
    </div>

    <div class="table-container">
        <div class="table-header">
            <div class="table-title">共 ${employees.size()} 名员工</div>
        </div>

        <c:choose>
            <c:when test="${not empty employees}">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>职位</th>
                        <th>联系方式</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="employee" items="${employees}">
                        <tr>
                            <td>${employee.id}</td>
                            <td>${employee.name}</td>
                            <td>${employee.gender}</td>
                            <td>${employee.position}</td>
                            <td>${employee.contact}</td>
                            <td>
                                <div class="actions">
                                    <a href="<c:url value='/admin/employees/edit/${employee.id}'/>"
                                       class="btn btn-edit btn-sm">编辑</a>
                                    <a href="<c:url value='/admin/employees/delete/${employee.id}'/>"
                                       class="btn btn-delete btn-sm"
                                       onclick="return confirm('确定要删除这名员工吗？')">删除</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <h3>暂无员工数据</h3>
                    <p>点击上方"添加员工"按钮开始添加员工信息</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>
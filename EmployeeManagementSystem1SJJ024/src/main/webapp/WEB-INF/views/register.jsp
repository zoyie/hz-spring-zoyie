<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册 - 员工管理系统</title>
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
            max-width: 600px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        .form-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 2rem;
        }
        .form-title {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 1.5rem;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #333;
        }
        .form-input, .form-select {
            width: 100%;
            padding: 1rem;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        .form-input:focus, .form-select:focus {
            outline: none;
            border-color: #667eea;
        }
        .form-actions {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
        }
    </style>
</head>
<body>
<header class="header">
    <div class="header-content">
        <h1 class="header-title">📝 注册</h1>
    </div>
</header>

<main class="main-content">
    <div class="form-container">
        <h2 class="form-title">创建新账号</h2>

        <form action="<c:url value='/auth/register'/>" method="post">
            <div class="form-group">
                <label for="username" class="form-label">用户名 *</label>
                <input id="username" name="username" class="form-input" value="${user.username}" placeholder="请输入用户名" required>
            </div>

            <div class="form-group">
                <label for="password" class="form-label">密码 *</label>
                <input type="password" id="password" name="password" class="form-input" placeholder="请输入密码" required>
            </div>

            <div class="form-group">
                <label for="email" class="form-label">邮箱 *</label>
                <input id="email" name="email" class="form-input" value="${user.email}" placeholder="请输入邮箱" required>
            </div>

            <div class="form-group">
                <label for="name" class="form-label">姓名 *</label>
                <input id="name" name="name" class="form-input" value="${user.name}" placeholder="请输入姓名" required>
            </div>

            <div class="form-group">
                <label for="role" class="form-label">角色 *</label>
                <select id="role" name="role" class="form-select" required>
                    <option value="">请选择角色</option>
                    <c:forEach var="role" items="${roles}">
                        <option value="${role}" ${user.role == role ? 'selected' : ''}>${role}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">注册</button>
                <a href="<c:url value='/auth/login'/>" class="btn btn-outline">返回登录</a>
            </div>
        </form>
    </div>

    <c:if test="${not empty error}">
        <div class="error-message" style="color: red; text-align: center; margin-top: 1rem;">
                ${error}
        </div>
    </c:if>
</main>
</body>
</html>
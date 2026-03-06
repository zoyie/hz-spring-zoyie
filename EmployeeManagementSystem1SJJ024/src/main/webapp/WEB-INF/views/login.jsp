<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户登录 - 员工管理系统</title>
    <style>
        body {
            font-family: 'Microsoft YaHei', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 1rem;
        }
        .login-container {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 20px 60px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 400px;
        }
        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        .login-title {
            font-size: 2rem;
            color: #333;
            margin-bottom: 0.5rem;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .form-input {
            width: 100%;
            padding: 1rem;
            border: 2px solid #e1e5e9;
            border-radius: 10px;
            font-size: 1rem;
            box-sizing: border-box;
        }
        .form-input:focus {
            outline: none;
            border-color: #667eea;
        }
        .btn-login {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }
        .alert {
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1rem;
        }
        .alert-error {
            background: #fee;
            color: #c53030;
            border: 1px solid #fed7d7;
        }
        .login-footer {
            text-align: center;
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 1px solid #e1e5e9;
        }
        .login-footer a {
            color: #667eea;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-header">
        <h1 class="login-title">
            <c:choose>
                <c:when test="${role == 'admin'}">🛡️ 管理员登录</c:when>
                <c:otherwise>👨‍💼 普通用户登录</c:otherwise>
            </c:choose>
        </h1>
        <p>请输入您的登录信息</p>
    </div>

    <c:if test="${not empty error}">
        <div class="alert alert-error">
                ${error}
        </div>
    </c:if>

    <form action="<c:url value='/auth/login'/>" method="post">
        <input type="hidden" name="role" value="${role}">

        <div class="form-group">
            <input type="text" name="username" class="form-input"
                   placeholder="请输入用户名" value="${param.username}" required>
        </div>

        <div class="form-group">
            <input type="password" name="password" class="form-input"
                   placeholder="请输入密码" required>
        </div>

        <button type="submit" class="btn-login">立即登录</button>
    </form>

    <div class="login-footer">
        <p>
            还没有账户？
            <a href="<c:url value='/auth/register'/>">立即注册</a>
            |
            <a href="<c:url value='/'/>">返回首页</a>
        </p>
        <p style="font-size: 0.9rem; color: #999; margin-top: 1rem;">
            测试账户:
            <c:choose>
                <c:when test="${role == 'admin'}">admin/admin123</c:when>
                <c:otherwise>employee/emp123</c:otherwise>
            </c:choose>
        </p>
    </div>
</div>
</body>
</html>

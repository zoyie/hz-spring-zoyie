<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户平台 - 员工管理系统</title>
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
        .header-user {
            display: flex;
            align-items: center;
            gap: 1rem;
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
        .btn-outline:hover {
            background: #667eea;
            color: white;
        }
        .main-content {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        .welcome-card {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 3rem;
            text-align: center;
        }
        .welcome-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
        }
        .welcome-title {
            font-size: 2rem;
            color: #333;
            margin-bottom: 0.5rem;
        }
        .welcome-desc {
            color: #666;
            font-size: 1.1rem;
        }
        .actions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }
        .action-card {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }
        .action-card:hover {
            transform: translateY(-5px);
        }
        .action-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        .action-title {
            font-size: 1.3rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 1rem;
        }
        .action-desc {
            color: #666;
            margin-bottom: 1.5rem;
        }
        .btn-primary {
            background: linear-gradient(135deg, #28a745, #20c997);
            color: white;
            padding: 0.8rem 2rem;
            border-radius: 25px;
            text-decoration: none;
            display: inline-block;
            font-weight: 600;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.3);
        }
    </style>
</head>
<body>
<header class="header">
    <div class="header-content">
        <h1 class="header-title">👨‍💼 用户平台</h1>
        <div class="header-user">
            <span>欢迎，${user.name != null ? user.name : user.username}</span>
            <a href="<c:url value='/auth/logout'/>" class="btn btn-outline">退出登录</a>
        </div>
    </div>
</header>

<main class="main-content">
    <!-- 欢迎卡片 -->
    <div class="welcome-card">
        <div class="welcome-icon">👋</div>
        <h2 class="welcome-title">欢迎回来，亲爱的用户！</h2>
    </div>

    <!-- 快速操作 -->
    <div class="actions-grid">
        <div class="action-card">
            <div class="action-icon">👥</div>
            <div class="action-title">员工列表</div>
            <div class="action-desc">查看公司所有员工信息</div>
            <a href="<c:url value='/employee/employees'/>" class="btn-primary">查看列表</a>
        </div>
        <div class="action-card">
            <div class="action-icon">💼</div>
            <div class="action-title">求职申请</div>
            <div class="action-desc">浏览职位并提交申请</div>
            <a href="<c:url value='/employee/jobs'/>" class="btn-primary">求职申请</a>
        </div>
        <div class="action-card">
            <div class="action-icon">📋</div>
            <div class="action-title">我的申请</div>
            <div class="action-desc">查看申请状态和历史</div>
            <a href="<c:url value='/employee/applications'/>" class="btn-primary">申请记录</a>
        </div>
    </div>
</main>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员控制台 - 员工管理系统</title>
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
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }
        .stat-card {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .stat-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 0.5rem;
        }
        .stat-label {
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
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 0.8rem 2rem;
            border-radius: 25px;
            text-decoration: none;
            display: inline-block;
            font-weight: 600;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
        }
    </style>
</head>
<body>
<header class="header">
    <div class="header-content">
        <h1 class="header-title">🛡️ 管理员控制台</h1>
        <div class="header-user">
            <span>欢迎，${user.name}</span>
            <a href="<c:url value='/auth/logout'/>" class="btn btn-outline">退出登录</a>
        </div>
    </div>
</header>

<main class="main-content">
    <!-- 统计数据 -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-icon">👥</div>
            <div class="stat-number">${totalEmployees}</div>
            <div class="stat-label">总员工数</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">💼</div>
            <div class="stat-number">${totalJobs}</div>
            <div class="stat-label">活跃职位</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">📋</div>
            <div class="stat-number">${pendingApplications}</div>
            <div class="stat-label">待处理申请</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">👤</div>
            <div class="stat-number">${totalUsers}</div>
            <div class="stat-label">注册用户</div>
        </div>
    </div>
    <!-- 快速操作 -->
    <div class="actions-grid">
        <div class="action-card">
            <div class="action-icon">👥</div>
            <div class="action-title">员工管理</div>
            <div class="action-desc">查看、添加、编辑员工信息</div>
            <a href="<c:url value='/admin/employees'/>" class="btn-primary">进入管理</a>
        </div>
        <div class="action-card">
            <div class="action-icon">💼</div>
            <div class="action-title">招聘管理</div>
            <div class="action-desc">发布职位、管理招聘流程</div>
            <a href="<c:url value='/admin/recruitment'/>" class="btn-primary">招聘管理</a>
        </div>
        <div class="action-card">
            <div class="action-icon">📋</div>
            <div class="action-title">申请管理</div>
            <div class="action-desc">处理求职申请和面试安排</div>
            <a href="<c:url value='/admin/applications'/>" class="btn-primary">申请管理</a>
        </div>

    </div>
</main>
</body>
</html>

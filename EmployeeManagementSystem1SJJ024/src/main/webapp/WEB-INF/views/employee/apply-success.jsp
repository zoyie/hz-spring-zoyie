<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>申请成功 - 员工管理系统</title>
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
    .success-container {
      background: white;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      padding: 2rem;
      text-align: center;
    }
    .success-icon {
      font-size: 4rem;
      color: #28a745;
      margin-bottom: 1rem;
    }
    .success-title {
      font-size: 1.5rem;
      color: #333;
      margin-bottom: 1rem;
    }
    .success-message {
      color: #666;
      margin-bottom: 2rem;
    }
  </style>
</head>
<body>
<header class="header">
  <div class="header-content">
    <h1 class="header-title">✓ 申请成功</h1>
    <a href="<c:url value='/employee/dashboard'/>" class="btn btn-outline">返回控制台</a>
  </div>
</header>

<main class="main-content">
  <div class="success-container">
    <div class="success-icon">✓</div>
    <h2 class="success-title">职位申请已提交</h2>
    <p class="success-message">您的申请已成功提交，感谢您的关注！</p>
    <a href="<c:url value='/employee/applications'/>" class="btn btn-primary">查看我的申请</a>
  </div>
</main>
</body>
</html>

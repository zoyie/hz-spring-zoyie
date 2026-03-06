<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>我的申请 - 员工管理系统</title>
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
    .status {
      padding: 0.25rem 0.5rem;
      border-radius: 12px;
      font-size: 0.8rem;
      font-weight: 600;
    }
    .status-pending {
      background: #fff3cd;
      color: #856404;
    }
    .status-approved {
      background: #d4edda;
      color: #155724;
    }
    .status-rejected {
      background: #f8d7da;
      color: #721c24;
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
    <h1 class="header-title">📋 我的申请</h1>
    <a href="<c:url value='/employee/dashboard'/>" class="btn btn-outline">返回控制台</a>
  </div>
</header>

<main class="main-content">
  <div class="content-header">
    <h2>我的职位申请</h2>
  </div>

  <div class="table-container">
    <div class="table-header">
      <div class="table-title">共 ${applications.size()} 条申请</div>
    </div>

    <c:choose>
      <c:when test="${not empty applications}">
        <table>
          <thead>
          <tr>
            <th>ID</th>
            <th>职位</th>
            <th>状态</th>
            <th>申请时间</th>
            <th>操作</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="application" items="${applications}">
            <tr>
              <td>${application.id}</td>
              <td>${application.job.title}</td>
              <td>
                                    <span class="status status-${application.status}">
                                        ${application.status == 'pending' ? '待处理' : (application.status == 'approved' ? '已通过' : '已拒绝')}
                                    </span>
              </td>
              <td>${application.applyTime}</td>
              <td>
                <c:if test="${application.status == 'pending'}">
                  <a href="<c:url value='/employee/applications/cancel/${application.id}'/>"
                     class="btn btn-outline btn-sm">撤销申请</a>
                </c:if>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </c:when>
      <c:otherwise>
        <div class="empty-state">
          <h3>暂无申请记录</h3>
          <p>您还没有申请任何职位</p>
        </div>
      </c:otherwise>
    </c:choose>
  </div>
</main>
</body>
</html>

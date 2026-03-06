<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>职位申请处理 - 员工管理系统</title>
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
    .btn-success {
      background: #28a745;
      color: white;
    }
    .btn-danger {
      background: #dc3545;
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
    .job-detail {
      background: white;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      padding: 2rem;
      margin-bottom: 2rem;
    }
    .job-title {
      font-size: 1.5rem;
      color: #333;
      margin-bottom: 1rem;
    }
    .job-meta {
      display: flex;
      gap: 1rem;
      margin-bottom: 1.5rem;
    }
    .job-meta-item {
      font-size: 0.9rem;
      color: #666;
    }
    .applications-table {
      background: white;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      overflow: hidden;
    }
    .table-header {
      padding: 1rem;
      border-bottom: 1px solid #e1e5e9;
      background-color: #f8f9fa;
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
    .action-form {
      margin-top: 0.5rem;
      display: flex;
      gap: 0.5rem;
    }
    .action-form input[type="text"] {
      padding: 0.5rem;
      border: 1px solid #ddd;
      border-radius: 5px;
      flex-grow: 1;
    }
  </style>
</head>
<body>
<header class="header">
  <div class="header-content">
    <h1 class="header-title">📋 职位申请处理</h1>
    <a href="<c:url value='/admin/dashboard'/>" class="btn btn-outline">返回控制台</a>
  </div>
</header>

<main class="main-content">
  <div class="content-header">
    <h2>${job.title} 的申请列表</h2>
    <a href="<c:url value='/admin/recruitment'/>" class="btn btn-outline">返回招聘管理</a>
  </div>

  <div class="job-detail">
    <h2 class="job-title">${job.title}</h2>
    <div class="job-meta">
      <span class="job-meta-item">📍 ${job.location}</span>
      <span class="job-meta-item">💰 ${job.salaryRange}</span>
      <span class="job-meta-item">📅 ${job.createTime}</span>
      <span class="job-meta-item">📝 ${job.status == 'active' ? '招聘中' : '已关闭'}</span>
    </div>
    <p>${job.description}</p>
  </div>

  <div class="applications-table">
    <div class="table-header">
      <div class="table-title">申请列表</div>
    </div>

    <table>
      <thead>
      <tr>
        <th>ID</th>
        <th>申请人</th>
        <th>申请时间</th>
        <th>状态</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="application" items="${applications}">
        <tr>
          <td>${application.id}</td>
          <td>${application.user.name}</td>
          <td>${application.applyTime}</td>
          <td>
                            <span class="status status-${application.status}">
                                ${application.status == 'pending' ? '待处理' : (application.status == 'approved' ? '已通过' : '已拒绝')}
                            </span>
          </td>
          <td>
            <form class="action-form" method="post" action="<c:url value='/admin/recruitment/applications/process'/>">
              <input type="hidden" name="id" value="${application.id}">
              <input type="hidden" name="jobId" value="${job.id}">
              <button type="submit" name="status" value="approved" ${application.status != 'pending' ? 'disabled' : ''} class="btn btn-success">批准</button>
              <button type="submit" name="status" value="rejected" ${application.status != 'pending' ? 'disabled' : ''} class="btn btn-danger">拒绝</button>
            </form>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</main>
</body>
</html>

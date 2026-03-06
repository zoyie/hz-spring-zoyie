<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>职位列表 - 员工管理系统</title>
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
    .jobs-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(400px, 1fr));
      gap: 2rem;
    }
    .job-card {
      background: white;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      padding: 1.5rem;
      transition: transform 0.3s ease;
    }
    .job-card:hover {
      transform: translateY(-2px);
    }
    .job-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      margin-bottom: 1rem;
    }
    .job-title {
      font-size: 1.2rem;
      font-weight: bold;
      color: #333;
      margin-bottom: 0.5rem;
    }
    .job-meta {
      font-size: 0.9rem;
      color: #666;
    }
    .job-status {
      padding: 0.25rem 0.5rem;
      border-radius: 12px;
      font-size: 0.8rem;
      font-weight: 600;
    }
    .status-active {
      background: #d4edda;
      color: #155724;
    }
    .status-inactive {
      background: #f8d7da;
      color: #721c24;
    }
    .job-description {
      color: #666;
      margin-bottom: 1rem;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
      overflow: hidden;
    }
    .job-actions {
      display: flex;
      gap: 0.5rem;
      flex-wrap: wrap;
    }
    .btn-sm {
      padding: 0.3rem 0.8rem;
      font-size: 0.8rem;
    }
    .btn-info {
      background: #17a2b8;
      color: white;
    }
    .btn-apply {
      background: #28a745;
      color: white;
    }
    .empty-state {
      text-align: center;
      padding: 3rem;
      color: #666;
      grid-column: 1 / -1;
    }
  </style>
</head>
<body>
<header class="header">
  <div class="header-content">
    <h1 class="header-title">🔍 职位搜索</h1>
    <a href="<c:url value='/employee/dashboard'/>" class="btn btn-outline">返回控制台</a>
  </div>
</header>

<main class="main-content">
  <div class="content-header">
    <h2>职位列表</h2>
  </div>

  <div class="jobs-grid">
    <c:choose>
      <c:when test="${not empty jobs}">
        <c:forEach var="job" items="${jobs}">
          <div class="job-card">
            <div class="job-header">
              <div>
                <h3 class="job-title">${job.title}</h3>
                <div class="job-meta">
                  📍 ${job.location} | 💰 ${job.salaryRange} |
                  📅 ${job.createTime}
                </div>
              </div>
              <span class="job-status ${job.status == 'active' ? 'status-active' : 'status-inactive'}">
                  ${job.status == 'active' ? '招聘中' : '已关闭'}
              </span>
            </div>

            <p class="job-description">${job.description}</p>

            <div class="job-actions">
              <c:if test="${!hasApplied[job.id]}">
                <a href="<c:url value='/employee/jobs/${job.id}/apply'/>"
                   class="btn btn-apply btn-sm">申请职位</a>
              </c:if>
            </div>
          </div>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <div class="empty-state">
          <h3>暂无职位信息</h3>
          <p>暂无可用职位，请稍后再试</p>
        </div>
      </c:otherwise>
    </c:choose>
  </div>
</main>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>编辑职位 - 员工管理系统</title>
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
      max-width: 800px;
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
    .form-input, .form-select, .form-textarea {
      width: 100%;
      padding: 1rem;
      border: 2px solid #e1e5e9;
      border-radius: 8px;
      font-size: 1rem;
      transition: border-color 0.3s ease;
    }
    .form-input:focus, .form-select:focus, .form-textarea:focus {
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
    <h1 class="header-title">✏️ 编辑职位</h1>
    <a href="<c:url value='/admin/recruitment'/>" class="btn btn-outline">返回招聘管理</a>
  </div>
</header>

<main class="main-content">
  <div class="form-container">
    <h2 class="form-title">编辑职位信息</h2>

    <form action="<c:url value='/admin/recruitment/save'/>" method="post">
      <input type="hidden" name="id" value="${job.id}">
      <input type="hidden" name="createdBy" value="${job.createdBy}">
      <input type="hidden" name="createTime" value="${job.createTime}">

      <div class="form-group">
        <label for="title" class="form-label">职位名称 *</label>
        <input id="title" name="title" class="form-input" value="${job.title}" placeholder="请输入职位名称" required>
      </div>

      <div class="form-group">
        <label for="description" class="form-label">职位描述 *</label>
        <textarea id="description" name="description" class="form-textarea" rows="4" placeholder="请输入职位描述" required>${job.description}</textarea>
      </div>

      <div class="form-group">
        <label for="requirements" class="form-label">职位要求 *</label>
        <textarea id="requirements" name="requirements" class="form-textarea" rows="4" placeholder="请输入职位要求" required>${job.requirements}</textarea>
      </div>

      <div class="form-group">
        <label for="department" class="form-label">部门 *</label>
        <input id="department" name="department" class="form-input" value="${job.department}" placeholder="请输入部门" required>
      </div>

      <div class="form-group">
        <label for="location" class="form-label">工作地点 *</label>
        <input id="location" name="location" class="form-input" value="${job.location}" placeholder="请输入工作地点" required>
      </div>

      <div class="form-group">
        <label for="salaryRange" class="form-label">薪资范围 *</label>
        <input id="salaryRange" name="salaryRange" class="form-input" value="${job.salaryRange}" placeholder="请输入薪资范围" required>
      </div>

      <div class="form-group">
        <label for="jobType" class="form-label">工作类型 *</label>
        <select id="jobType" name="jobType" class="form-select" required>
          <option value="">请选择工作类型</option>
          <option value="full-time" ${job.jobType == 'full-time' ? 'selected' : ''}>全职</option>
          <option value="part-time" ${job.jobType == 'part-time' ? 'selected' : ''}>兼职</option>
          <option value="contract" ${job.jobType == 'contract' ? 'selected' : ''}>合同工</option>
        </select>
      </div>

      <div class="form-group">
        <label for="status" class="form-label">职位状态 *</label>
        <select id="status" name="status" class="form-select" required>
          <option value="">请选择职位状态</option>
          <option value="active" ${job.status == 'active' ? 'selected' : ''}>招聘中</option>
          <option value="inactive" ${job.status == 'inactive' ? 'selected' : ''}>已关闭</option>
          <option value="closed" ${job.status == 'closed' ? 'selected' : ''}>已结束</option>
        </select>
      </div>

      <div class="form-actions">
        <button type="submit" class="btn btn-primary">更新职位</button>
        <a href="<c:url value='/admin/recruitment'/>" class="btn btn-outline">取消</a>
      </div>
    </form>
  </div>
</main>
</body>
</html>

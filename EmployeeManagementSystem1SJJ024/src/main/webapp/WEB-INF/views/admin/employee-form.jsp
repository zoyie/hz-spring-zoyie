<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${employee.id != null ? '编辑' : '添加'}员工 - 员工管理系统</title>
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
            margin-bottom: 2rem;
            text-align: center;
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
        .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 1rem 2rem;
            border-radius: 8px;
        }
        .btn-secondary {
            background: #6c757d;
            color: white;
            padding: 1rem 2rem;
            border-radius: 8px;
        }
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
<header class="header">
    <div class="header-content">
        <h1 class="header-title">
            ${employee.id != null ? '✏️ 编辑员工' : '➕ 添加员工'}
        </h1>
        <a href="<c:url value='/admin/employees'/>" class="btn btn-outline">返回列表</a>
    </div>
</header>

<main class="main-content">
    <div class="form-container">
        <h2 class="form-title">${employee.id != null ? '编辑员工信息' : '添加新员工'}</h2>

        <form action="<c:url value='/admin/employees/save'/>" method="post">
            <c:if test="${employee.id != null}">
                <input type="hidden" name="id" value="${employee.id}">
            </c:if>

            <div class="form-group">
                <label for="name" class="form-label">姓名 *</label>
                <input type="text" id="name" name="name" class="form-input"
                       value="${employee.name}" placeholder="请输入员工姓名" required>
            </div>

            <div class="form-group">
                <label for="gender" class="form-label">性别 *</label>
                <select id="gender" name="gender" class="form-select" required>
                    <option value="">请选择性别</option>
                    <option value="男" ${employee.gender == '男' ? 'selected' : ''}>男</option>
                    <option value="女" ${employee.gender == '女' ? 'selected' : ''}>女</option>
                </select>
            </div>

            <div class="form-group">
                <label for="position" class="form-label">职位 *</label>
                <input type="text" id="position" name="position" class="form-input"
                       value="${employee.position}" placeholder="请输入职位" required>
            </div>

            <div class="form-group">
                <label for="contact" class="form-label">联系方式 *</label>
                <input type="text" id="contact" name="contact" class="form-input"
                       value="${employee.contact}" placeholder="请输入联系方式" required>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    ${employee.id != null ? '更新' : '添加'}
                </button>
                <a href="<c:url value='/admin/employees'/>" class="btn btn-secondary">取消</a>
            </div>
        </form>
    </div>
</main>
</body>
</html>

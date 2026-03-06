DROP DATABASE IF EXISTS ssm;-- 创建数据库
CREATE DATABASE ssm;-- 选中数据库
USE ssm;-- 删除已有表（如果存在）
DROP TABLE IF EXISTS Employee;-- 创建员工信息表
DROP TABLE IF EXISTS job;--
DROP TABLE IF EXISTS Employee;-- 创建员工信息表
DROP TABLE IF EXISTS job_application;--
CREATE TABLE `Employee` (
                            `id` INT(11) NOT NULL AUTO_INCREMENT,    -- 员工ID，主键自增
                            `name` VARCHAR(32),
                            `gender` VARCHAR(8),
                            `position` VARCHAR(32),
                            `contact` VARCHAR(32),
                            PRIMARY KEY (`id`)
);-- 插入4条样例数据
INSERT INTO `Employee` (`name`, `gender`, `position`, `contact`)
VALUES
    ('张三', '男', '项目经理', '13800000001'),
    ('李四', '女', '前端开发工程师', '13800000002'),
    ('赵五', '男', '后端开发工程师', '13800000003'),
    ('王六', '女', '测试工程师', '13800000004');-- 查询员工信息表
SELECT * FROM Employee;

CREATE TABLE IF NOT EXISTS user (
                                    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
                                    username VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
    password VARCHAR(100) NOT NULL COMMENT '密码',
    email VARCHAR(100) NOT NULL COMMENT '邮箱',
    name VARCHAR(50) NOT NULL COMMENT '真实姓名',
    phone VARCHAR(20) COMMENT '手机号',
    role VARCHAR(20) DEFAULT 'employee' COMMENT '角色(admin/employee)',
    status VARCHAR(20) DEFAULT 'active' COMMENT '状态(active/inactive)',
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 创建职位表
CREATE TABLE IF NOT EXISTS job (
                                   id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '职位ID',
                                   title VARCHAR(100) NOT NULL COMMENT '职位标题',
    description TEXT COMMENT '职位描述',
    requirements TEXT COMMENT '职位要求',
    department VARCHAR(50) COMMENT '部门',
    location VARCHAR(100) COMMENT '工作地点',
    salary_range VARCHAR(50) COMMENT '薪资范围',
    job_type VARCHAR(20) DEFAULT 'full-time' COMMENT '工作类型(full-time/part-time/contract)',
    status VARCHAR(20) DEFAULT 'active' COMMENT '状态(active/inactive/closed)',
    created_by BIGINT COMMENT '创建人ID',
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (created_by) REFERENCES user(id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='职位表';

-- 创建求职申请表
CREATE TABLE IF NOT EXISTS job_application (
                                               id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '申请ID',
                                               job_id BIGINT NOT NULL COMMENT '职位ID',
                                               user_id BIGINT NOT NULL COMMENT '用户ID',
                                               resume TEXT COMMENT '简历',
                                               cover_letter TEXT COMMENT '求职信',
                                               status VARCHAR(20) DEFAULT 'pending' COMMENT '状态(pending/approved/rejected)',
    feedback TEXT COMMENT '反馈',
    apply_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
    process_time TIMESTAMP NULL COMMENT '处理时间',
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    UNIQUE KEY unique_application (job_id, user_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='求职申请表';


INSERT INTO user (username, password, email, name, phone, role, status) VALUES
                                                                            ('admin', 'admin123', 'admin@company.com', '系统管理员', '13800000000', 'admin', 'active'),
                                                                            ('employee', 'emp123', 'employee@company.com', '普通员工', '13800000001', 'employee', 'active'),
                                                                            ('zhangsan', '123456', 'zhangsan@company.com', '张三', '13800000002', 'employee', 'active'),
                                                                            ('lisi', '123456', 'lisi@company.com', '李四', '13800000003', 'employee', 'active');

INSERT INTO job (title, description, requirements, department, location, salary_range, job_type, status, created_by) VALUES
                                                                                                                         ('前端开发工程师', '负责公司前端产品的开发和维护', '熟悉Vue.js、React等前端框架，有2年以上工作经验', '技术部', '北京', '8K-15K', 'full-time', 'active', 1),
                                                                                                                         ('Java后端工程师', '负责后端服务的开发和优化', '熟悉Spring Boot、MyBatis，有Java开发经验', '技术部', '上海', '10K-18K', 'full-time', 'active', 1),
                                                                                                                         ('产品经理', '负责产品规划和需求分析', '有产品设计经验，熟悉用户体验设计', '产品部', '深圳', '12K-20K', 'full-time', 'active', 1),
                                                                                                                         ('UI设计师', '负责产品界面设计和用户体验优化', '熟悉Figma、Sketch等设计工具', '设计部', '广州', '7K-12K', 'full-time', 'active', 1);

INSERT INTO job_application (job_id, user_id, resume, cover_letter, status) VALUES
                                                                                (1, 3, '我是张三，有3年前端开发经验...', '我对贵公司的前端开发职位很感兴趣...', 'pending'),
                                                                                (2, 4, '我是李四，熟悉Java开发...', '希望能加入贵公司技术团队...', 'approved');


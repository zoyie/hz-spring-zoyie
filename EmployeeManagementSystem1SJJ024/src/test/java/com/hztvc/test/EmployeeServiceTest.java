package com.hztvc.test;

import com.hzvtc.domain.Employee;
import com.hzvtc.service.EmployeeService;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class EmployeeServiceTest {
    public static void main(String[] args) {
        // 加载 Spring 配置文件
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("application-dao.xml", "application-service.xml");
        EmployeeService employeeService = context.getBean(EmployeeService.class);

        // 初始查询所有员工
        System.out.println("=== 初始员工列表 ===");
        List<Employee> initialEmployees = employeeService.findAllSJJ024();
        initialEmployees.forEach(System.out::println);

        // 1. 增加员工
        System.out.println("\n=== 添加员工 ===");
        Employee newEmployee = new Employee();
        newEmployee.setName("黄七");
        newEmployee.setGender("女");
        newEmployee.setPosition("产品经理");
        newEmployee.setContact("13100000001");
        employeeService.saveSJJ024(newEmployee);
        System.out.println("添加员工成功，ID：" + newEmployee.getId());
        System.out.println(newEmployee);

        // 添加员工后查询所有员工
        System.out.println("\n=== 添加后员工列表 ===");
        List<Employee> employeesAfterAdd = employeeService.findAllSJJ024();
        employeesAfterAdd.forEach(System.out::println);

        // 2. 删除员工
        System.out.println("\n=== 删除员工 ===");
        employeeService.deleteSJJ024(4);
        System.out.println("删除员工ID 4 成功");

        // 删除员工后查询所有员工
        System.out.println("\n=== 删除后员工列表 ===");
        List<Employee> employeesAfterDelete = employeeService.findAllSJJ024();
        employeesAfterDelete.forEach(System.out::println);

        // 3. 更新员工
        System.out.println("\n=== 更新员工 ===");
        Employee employeeToUpdate = employeeService.findByIdSJJ024(2);
        if (employeeToUpdate != null) {
            employeeToUpdate.setName("李小四");
            employeeToUpdate.setGender("女");
            employeeToUpdate.setPosition("部门经理");
            employeeToUpdate.setContact("13888888888");
            employeeService.updateSJJ024(employeeToUpdate);
            System.out.println("更新员工ID 2 成功");
        } else {
            System.out.println("未找到员工ID 2");
        }

        // 更新员工后查询所有员工
        System.out.println("\n=== 更新后员工列表 ===");
        List<Employee> employeesAfterUpdate = employeeService.findAllSJJ024();
        employeesAfterUpdate.forEach(System.out::println);

        // 4. 查询员工
        System.out.println("\n=== 查询员工 ===");
        Employee retrievedEmployee = employeeService.findByIdSJJ024(2);
        if (retrievedEmployee != null) {
            System.out.println("查询员工ID 2 成功：" + retrievedEmployee);
        } else {
            System.out.println("未找到员工ID 2");
        }

        // 查询员工后查询所有员工
        System.out.println("\n=== 查询后员工列表 ===");
        List<Employee> employeesAfterRetrieve = employeeService.findAllSJJ024();
        employeesAfterRetrieve.forEach(System.out::println);

        // 关闭上下文
        context.close();
    }
}

package com.cinema.dao;

import com.ttms.cinema.Employee;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("EmployeeDAO")
public interface EmployeeDAO {

    public void insertEmployee(Employee employee);
    public void deleteEmployee(int emp_id);
    public void updateEmployee(Employee employee);

    public Employee selectEmployeeByEmp_id(int emp_id);
    public Employee selectEmployeeByEmp_no(String emp_no);
    public List<Employee> selectEmployeeByType(int type);
    public List<Employee> selectEmployeeByEmp_name(String emp_name);
    public Employee selectEmployeeByEmp_tel_num(String emp_tel_num);
    public List<Employee> selectEmployeeByEmp_addr(String emp_addr);
    public Employee selectEmployeeByEmp_email(String emp_email);
    public List<Employee> selectEmployeeByEmp_sex(String emp_sex);
    public List<Employee> selectEmployeeByEmp_birth(String emp_birth);
    public List<Employee> selectEmployeeByEmp_native(String emp_native);
    public List<Employee> selectEmployee();
    public List<Employee> selectCommonEmployee();
    public List<Employee> selectTopEmployee();
}

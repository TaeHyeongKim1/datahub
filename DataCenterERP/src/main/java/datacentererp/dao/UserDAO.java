package datacentererp.dao;

import org.apache.ibatis.annotations.Insert;

import datacentererp.model.Admin;
import datacentererp.model.Customer;


public interface UserDAO {

    @Insert("INSERT INTO CUSTOMER (username, password, name, company_number, role) VALUES (#{username}, #{password}, #{name}, #{companyNumber}, #{role})")
    void insertCustomer(Customer customer);

    @Insert("INSERT INTO ADMIN (username, password, name, employee_number, position, role) VALUES (#{username}, #{password}, #{name}, #{employeeNumber}, #{position}, #{role})")
    void insertAdmin(Admin admin);
}
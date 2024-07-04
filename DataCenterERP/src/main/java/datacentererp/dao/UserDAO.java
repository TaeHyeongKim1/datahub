package datacentererp.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import datacentererp.model.Admin;
import datacentererp.model.Customer;


public interface UserDAO {

    @Insert("INSERT INTO CUSTOMER (username, password, name, companynumber, role) VALUES (#{username}, #{password}, #{name}, #{companyNumber}, #{role})")
    void insertCustomer(Customer customer);

    @Insert("INSERT INTO ADMIN (username, password, name, employeenumber, position, role) VALUES (#{username}, #{password}, #{name}, #{employeeNumber}, #{position}, #{role})")
    void insertAdmin(Admin admin);
    
    @Select("SELECT COUNT(*) FROM customer WHERE username = #{username} AND password = #{password}")
    boolean isValidCustomerUser(@Param("username") String username, @Param("password") String password);

    @Select("SELECT COUNT(*) FROM admin WHERE username = #{username} AND password = #{password}")
    boolean isValidAdminUser(@Param("username") String username, @Param("password") String password);
    
    @Select("SELECT * FROM admin WHERE username = #{username}")
    Admin getAdminByUsername(@Param("username") String username);

    @Select("SELECT * FROM customer WHERE username = #{username}")
    Customer getCustomerByUsername(@Param("username") String username);
}
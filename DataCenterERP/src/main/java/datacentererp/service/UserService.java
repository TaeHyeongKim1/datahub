package datacentererp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import datacentererp.dao.UserDAO;
import datacentererp.model.Admin;
import datacentererp.model.Customer;

@Service
public class UserService {

    @Autowired
    private UserDAO userDAO;

    public void registerCustomer(String username, String password, String name, String companyNumber) {
        Customer customer = new Customer();
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setName(name);
        customer.setCompanyNumber(companyNumber);
        customer.setRole("CUSTOMER");
        userDAO.insertCustomer(customer);
    }

    public void registerAdmin(String username, String password, String name, String employeeNumber, String position) {
        Admin admin = new Admin();
        admin.setUsername(username);
        admin.setPassword(password);
        admin.setName(name);
        admin.setEmployeeNumber(employeeNumber);
        admin.setPosition(position);
        admin.setRole("ADMIN");
        userDAO.insertAdmin(admin);
    }
    
    public boolean validateUser(String username, String password, String loginType) {
        if ("customer".equals(loginType)) {
            return userDAO.isValidCustomerUser(username, password);
        } else if ("admin".equals(loginType)) {
            return userDAO.isValidAdminUser(username, password);
        }
        return false;
    }
}

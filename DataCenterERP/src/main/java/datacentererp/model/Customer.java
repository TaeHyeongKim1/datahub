package datacentererp.model;

public class Customer {
	private String username;
    private String password;
    private String name;
    private String companyNumber;
    private String role;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompanyNumber() {
		return companyNumber;
	}
	public void setCompanyNumber(String companyNumber) {
		this.companyNumber = companyNumber;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Customer(String username, String password, String name, String companyNumber, String role) {
		super();
		this.username = username;
		this.password = password;
		this.name = name;
		this.companyNumber = companyNumber;
		this.role = role;	
	}
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
}

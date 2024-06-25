package datacentererp.model;

import java.util.Date;

public class Asset {
	 private Integer id;
	    private String name;
	    private String type;
	    private String status;
	    private Date purchase_Date;
	    private Date maintenance_Schedule;
	    private String location;
	    private String ip_address;
	    private String mac_address;
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public Date getPurchase_Date() {
			return purchase_Date;
		}
		public void setPurchase_Date(Date purchase_Date) {
			this.purchase_Date = purchase_Date;
		}
		public Date getMaintenance_Schedule() {
			return maintenance_Schedule;
		}
		public void setMaintenance_Schedule(Date maintenance_Schedule) {
			this.maintenance_Schedule = maintenance_Schedule;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getIp_address() {
			return ip_address;
		}
		public void setIp_address(String ip_address) {
			this.ip_address = ip_address;
		}
		public String getMac_address() {
			return mac_address;
		}
		public void setMac_address(String mac_address) {
			this.mac_address = mac_address;
		}
		public Asset(Integer id, String name, String type, String status, Date purchase_Date, Date maintenance_Schedule,
				String location, String ip_address, String mac_address) {
			super();
			this.id = id;
			this.name = name;
			this.type = type;
			this.status = status;
			this.purchase_Date = purchase_Date;
			this.maintenance_Schedule = maintenance_Schedule;
			this.location = location;
			this.ip_address = ip_address;
			this.mac_address = mac_address;
		}
		public Asset() {
			super();
			// TODO Auto-generated constructor stub
		}
}

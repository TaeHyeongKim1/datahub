package datacentererp.scheduler;

import datacentererp.model.Asset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Component
public class DatabaseBackupScheduler {

    private final JdbcTemplate jdbcTemplate;     //jdbc객체 선언

    @Autowired
    public DatabaseBackupScheduler(DataSource dataSource) {     
        this.jdbcTemplate = new JdbcTemplate(dataSource);    //생성자에 주입된dataSource로 JDBC 객체 초기화
    }

    @Scheduled(cron = "0 0 0 * * *") // 매일 오전 11시에 실행 backup-20240711-000000.sql	
    public void performDbBackup() throws IOException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");
        String backupFileName = "backup-" + dateFormat.format(new Date()) + ".txt";

        String backupQuery = "SELECT * FROM assets"; // 백업할 데이터베이스 쿼리

        try (FileWriter writer = new FileWriter("C:/Users/taehe/git/Datahub/backup/" + backupFileName)) {
            List<Asset> assets = jdbcTemplate.query(backupQuery, (rs, rowNum) -> { 
                Asset asset = new Asset();
                asset.setId(rs.getInt("id"));
                asset.setName(rs.getString("name"));
                asset.setType(rs.getString("type"));
                asset.setStatus(rs.getString("status"));
                asset.setPurchase_Date(rs.getDate("purchase_date"));
                asset.setMaintenance_Schedule(rs.getDate("maintenance_schedule"));
                asset.setLocation(rs.getString("location"));
                asset.setIp_address(rs.getString("ip_address"));
                asset.setMac_address(rs.getString("mac_address"));
                return asset;
            });

            for (Asset asset : assets) {
                String sql = "INSERT INTO assets (id, name, type, status, purchase_date, maintenance_schedule, location, ip_address, mac_address) " +
                             "VALUES (" + asset.getId() + ", '" + asset.getName() + "', '" + asset.getType() + "', '" + asset.getStatus() + "', " +
                             "'" + asset.getPurchase_Date() + "', '" + asset.getMaintenance_Schedule() + "', '" + asset.getLocation() + "', '" +
                             asset.getIp_address() + "', '" + asset.getMac_address() + "');\n";
                writer.write(sql);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("데이터베이스 백업이 성공적으로 완료되었습니다.");
    }
}

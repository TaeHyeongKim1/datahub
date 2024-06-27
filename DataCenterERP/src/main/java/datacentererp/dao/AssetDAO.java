package datacentererp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import datacentererp.model.Asset;

public interface AssetDAO {
    @Select("SELECT * FROM assets WHERE id = #{id}")
    Asset getAssetById(@Param("id") int id);

    @Update("UPDATE assets SET name = #{name},"
            + " type = #{type}, "
            + "status = #{status}, "
            + "purchase_date = to_date(#{purchase_DateStr}, 'YYYY-MM-DD'), "
            + "maintenance_schedule =to_date(#{maintenance_ScheduleStr}, 'YYYY-MM-DD'), "
            + "location = #{location}, "
            + "ip_address = #{ip_address}, "
            + "mac_address = #{mac_address} "
            + "WHERE id = #{id}")
    void updateAsset(Asset asset);

    @Insert("INSERT INTO assets(name, type, status, purchase_date, maintenance_schedule, location, ip_address, mac_address) VALUES (#{name}, #{type}, #{status},to_date('#{purchase_DateStr}', 'YYYY-MM-DD'), "
    		+ "to_date('#{maintenance_ScheduleStr}','YYYY-MM-DD'), #{location}, #{ip_address}, #{mac_address})")
    void insertAsset(Asset asset);

    @Delete("DELETE FROM assets WHERE id = #{id}")
    void deleteAsset(@Param("id") int id);

    @Select("SELECT * FROM assets")
    List<Asset> getAllAssets();

    @Select("SELECT type, COUNT(*) as count FROM assets GROUP BY type")
    List<Map<String, Object>> getAssetCountByType();
    
	/*
	 * @Select("SELECT * FROM assets WHERE status = #{status}") List<Asset>
	 * getAssetsByStatus(@Param("status") String status);
	 * 
	 * @Select("SELECT * FROM assets WHERE maintenance_schedule IS NOT NULL")
	 * List<Asset> getMaintenanceAssets();
	 * 
	 * @Select("SELECT log FROM recent_logs ORDER BY timestamp DESC LIMIT 10")
	 * List<String> getRecentLogs();
	 */
}

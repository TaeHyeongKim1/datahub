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

    @Update("UPDATE assets SET name = #{name}, type = #{type}, status = #{status}, purchase_date = #{purchaseDate}, maintenance_schedule = #{maintenanceSchedule}, location = #{location}, ip_address = #{ipAddress}, mac_address = #{macAddress} WHERE id = #{id}")
    void updateAsset(Asset asset);

    @Insert("INSERT INTO assets(name, type, status, purchase_date, maintenance_schedule, location, ip_address, mac_address) VALUES (#{name}, #{type}, #{status}, #{purchaseDate}, #{maintenanceSchedule}, #{location}, #{ipAddress}, #{macAddress})")
    void insertAsset(Asset asset);

    @Delete("DELETE FROM assets WHERE id = #{id}")
    void deleteAsset(@Param("id") int id);

    @Select("SELECT * FROM assets")
    List<Asset> getAllAssets();

    @Select("SELECT type, COUNT(*) as count FROM assets GROUP BY type")
    List<Map<String, Object>> getAssetCountByType();
}

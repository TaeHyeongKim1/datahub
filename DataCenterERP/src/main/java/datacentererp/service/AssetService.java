package datacentererp.service;

import datacentererp.dao.AssetDAO;
import datacentererp.model.Asset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class AssetService {
    @Autowired(required=false)
    private AssetDAO assetDAO;

    public void updateAsset(Asset asset) {
        assetDAO.updateAsset(asset);
    }

    public Asset getAssetById(int id) {
        return assetDAO.getAssetById(id);
    }

    public void insertAsset(Asset asset) {
        assetDAO.insertAsset(asset);
    }

    public void deleteAsset(int id) {
        assetDAO.deleteAsset(id);
    }

    public List<Asset> getAllAssets() {
        return assetDAO.getAllAssets();
    }

    public List<Map<String, Object>> getAssetCountByType() {
        return assetDAO.getAssetCountByType();
    }
}

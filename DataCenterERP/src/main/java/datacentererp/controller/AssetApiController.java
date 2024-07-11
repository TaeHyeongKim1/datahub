package datacentererp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import datacentererp.service.AssetService;

@RestController
@RequestMapping("/api")
public class AssetApiController {

    @Autowired
    private AssetService assetService;

    @GetMapping("/assets/total")
    public int getTotalAssets() {
        return assetService.getTotalAssets();
    }

    @GetMapping("/assets/problem")
    public int getProblemAssets() {
        return assetService.getCountByStatus("폐기");
    }

    @GetMapping("/assets/maintenance")
    public int getMaintenanceAssets() {
        return assetService.getMaintenanceCount();
    }

    @GetMapping("/assets/operational")
    public int getOperationalAssets() {
        return assetService.getCountByStatus("운영");
    }
}
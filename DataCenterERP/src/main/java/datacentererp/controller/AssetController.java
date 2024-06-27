package datacentererp.controller;

import datacentererp.model.Asset;
import datacentererp.service.AssetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class AssetController {

    @Autowired
    private AssetService assetService;

    @RequestMapping("assets.do")
    public String getAllAssets(Model model) {
        List<Asset> assets = assetService.getAllAssets();
        model.addAttribute("assets", assets);
        return "assetList";
    }

    @GetMapping("new.do")
    public String showAddAssetForm(Model model) {
        model.addAttribute("asset", new Asset());
        return "assetForm";
    }

    @PostMapping("create.do")
    public String createAsset(@ModelAttribute Asset asset) {
        assetService.insertAsset(asset);
        return "redirect:/assets.do";
    }

    @GetMapping("assets/{id}/edit.do")
    public String showEditAssetForm(@PathVariable("id") int id, Model model) {
        Asset asset = assetService.getAssetById(id);
        model.addAttribute("asset", asset);
        return "assetDetail";
    }

    @PostMapping("assets/update.do")
    public String updateAsset(@ModelAttribute Asset asset, Model model) {
        assetService.updateAsset(asset);
        System.out.println("성공");
        model.addAttribute("msg", "성공적으로 완료했습니다");
        model.addAttribute("asset", assetService.getAssetById(asset.getId()));
        return "assetDetail";
    }

    @GetMapping("countByType.do")
    @ResponseBody
    public List<Map<String, Object>> getAssetCountByType() {
        return assetService.getAssetCountByType();
    }

    @PostMapping("{id}/delete.do")
    public String deleteAsset(@PathVariable("id") int id) {
        assetService.deleteAsset(id);
        return "redirect:/assets.do";
    }
	/*
	 * @GetMapping("dashboard.do") public String showDashboard(Model model) {
	 * List<Map<String, Object>> assetCountByType =
	 * assetService.getAssetCountByType(); int totalAssets =
	 * assetService.getAllAssets().size(); int problemAssets =
	 * assetService.getAssetsByStatus("폐기").size(); // '문제' 상태의 자산 수 int
	 * maintenanceAssets = assetService.getMaintenanceAssets().size(); // 유지보수 예정 자산
	 * 수 List<String> recentLogs = assetService.getRecentLogs(); // 최근 활동 로그
	 * 
	 * model.addAttribute("assetCountByType", assetCountByType);
	 * model.addAttribute("totalAssets", totalAssets);
	 * model.addAttribute("problemAssets", problemAssets);
	 * model.addAttribute("maintenanceAssets", maintenanceAssets);
	 * model.addAttribute("recentLogs", recentLogs);
	 * 
	 * return "mainContent"; }
	 */
}

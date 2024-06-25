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
        return "redirect:/assets";
    }

    @GetMapping("{id}/edit.do")
    public String showEditAssetForm(@PathVariable("id") int id, Model model) {
        Asset asset = assetService.getAssetById(id);
        model.addAttribute("asset", asset);
        return "assetForm";
    }

    @PostMapping("update.do")
    public String updateAsset(@ModelAttribute Asset asset, Model model) {
        assetService.updateAsset(asset);
        model.addAttribute("msg", "Asset updated successfully");
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
        return "redirect:/assets";
    }
}

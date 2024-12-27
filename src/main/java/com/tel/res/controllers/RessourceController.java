package com.tel.res.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tel.res.entities.Ressource;
import com.tel.res.service.RessourceService;

@Controller
public class RessourceController {

    private static final Logger logger = LoggerFactory.getLogger(RessourceController.class);

    @Autowired
    private RessourceService ressourceService;

    @RequestMapping("/showCreate")
    public String showCreate(ModelMap modelMap) {
        return "CreateRessource";
    }

    @RequestMapping("/saveRessource")
    public String saveRessource(@RequestParam("resources") String resourcesJson, ModelMap modelMap) {
        ObjectMapper objectMapper = new ObjectMapper();
        List<Ressource> resources = new ArrayList<>();
        List<String> existingResources = new ArrayList<>();
        List<String> savedResourceIds = new ArrayList<>();

        try {
            resources = objectMapper.readValue(resourcesJson, new TypeReference<List<Ressource>>() {});
        } catch (Exception e) {
            modelMap.addAttribute("msg", "Erreur de traitement des données JSON.");
            return "CreateRessource";
        }

        for (Ressource resource : resources) {
            if (ressourceService.existBySim(resource.getSim())) {
                existingResources.add(resource.getSim());
            } else {
                Ressource savedResource = ressourceService.saveRessource(resource);
                savedResourceIds.add(String.valueOf(savedResource.getId()));
            }
        }

        StringBuilder msg = new StringBuilder();
        if (!existingResources.isEmpty()) {
            msg.append("Certaines ressources existent déjà : ").append(String.join(", ", existingResources)).append(". ");
        }

        if (!savedResourceIds.isEmpty()) {
            msg.append("Ressources enregistrées avec les IDs : ").append(String.join(", ", savedResourceIds));
        } else if (existingResources.isEmpty()) {
            msg.append("Aucune ressource ajoutée.");
        }

        modelMap.addAttribute("msg", msg.toString());
        return "CreateRessource";
    }

    @RequestMapping("/listeRessource")
    public String listeRessource(ModelMap modelMap) {
        List<Ressource> res = ressourceService.getAllRessources();
        modelMap.addAttribute("ressources", res);
        return "listeRessource";
    }

    @GetMapping("/admin")
    public String login(ModelMap model) {
        return "CreateRessource";
    }

    @RequestMapping("/delete/{id}")
    public String deleteMyList(@PathVariable("id") long id) {
        ressourceService.deteteRessourceByID(id);
        return "redirect:/listeRessource";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, ModelMap modelMap) {
        Ressource ressource = ressourceService.getRessource(id);
        modelMap.addAttribute("p", ressource);
        return "RessourceEdit";
    }

    @PostMapping("/uploadRessourceFile")
    public String uploadRessourceFile(@RequestParam("resourceFile") MultipartFile file, RedirectAttributes redirectAttributes) {
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("msg", "Veuillez sélectionner un fichier.");
            return "redirect:/showCreate";
        }

        List<String> existingResources = new ArrayList<>();
        List<String> savedResourceIds = new ArrayList<>();

        try {
            List<Ressource> resources = parseExcelFile(file);

            for (Ressource resource : resources) {
                if (ressourceService.existBySim(resource.getSim())) {
                    existingResources.add(resource.getSim());
                } else {
                    Ressource savedResource = ressourceService.saveRessource(resource);
                    savedResourceIds.add(String.valueOf(savedResource.getId()));
                }
            }

            if (!existingResources.isEmpty()) {
                redirectAttributes.addFlashAttribute("msg", "Certaines ressources existent déjà : " + String.join(", ", existingResources));
            }

            if (!savedResourceIds.isEmpty()) {
                String msg = "Ressources ajoutées avec succès. IDs : " + String.join(", ", savedResourceIds);
                redirectAttributes.addFlashAttribute("msg", msg);
            } else if (existingResources.isEmpty()) {
                redirectAttributes.addFlashAttribute("msg", "Aucune ressource ajoutée.");
            }

        } catch (IOException e) {
            logger.error("Error reading file", e);
            redirectAttributes.addFlashAttribute("msg", "Erreur lors de la lecture du fichier.");
        }

        return "redirect:/showCreate";
    }

    private List<Ressource> parseExcelFile(MultipartFile file) throws IOException {
        List<Ressource> resources = new ArrayList<>();
        try (Workbook workbook = new XSSFWorkbook(file.getInputStream())) {
            Sheet sheet = workbook.getSheetAt(0);

            for (Row row : sheet) {
                Cell simCell = row.getCell(0);
                Cell msisdnCell = row.getCell(1);
                Cell dateCell = row.getCell(2);

                if (simCell != null && msisdnCell != null) {
                    String sim = getCellValueAsString(simCell);
                    String msisdn = getCellValueAsString(msisdnCell);
                    Date date = dateCell != null ? getCellValueAsDate(dateCell) : new Date();
                    
                    // Log pour déboguer
                    System.out.println("Read from Excel - SIM: " + sim + ", MSISDN: " + msisdn + ", Date: " + date);
                    
                    resources.add(new Ressource(sim, msisdn, date));
                }
            }
        }
        System.out.println("Total resources parsed: " + resources.size());
        return resources;
    }

    @GetMapping("/")
    public String redirectToHome() {
        return "redirect:/home";
    }

    private String getCellValueAsString(Cell cell) {
        if (cell == null) return "";
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    return cell.getDateCellValue().toString();
                } else {
                    double numericValue = cell.getNumericCellValue();
                    // Vérifiez si le nombre est entier
                    if (numericValue == (long) numericValue) {
                        return String.format("%.0f", numericValue);  // Formater sans décimales
                    } else {
                        return String.valueOf(numericValue);
                    }
                }
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            case FORMULA:
                return cell.getCellFormula();
            case BLANK:
                return "";
            default:
                return "Unsupported cell type";
        }
    }
    @GetMapping("/resource-stats")
    @ResponseBody
    public Map<String, Long> getResourceStats() {
        Map<String, Long> stats = ressourceService.getResourceCountsByDate();
        System.out.println("Resource Stats: " + stats); // Débogage
        return stats;
    }


    private Date getCellValueAsDate(Cell cell) {
        if (cell.getCellType() == CellType.NUMERIC && DateUtil.isCellDateFormatted(cell)) {
            return cell.getDateCellValue();
        }
        return null;
    }
}

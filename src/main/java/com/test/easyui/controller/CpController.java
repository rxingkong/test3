package com.test.easyui.controller;

import com.github.pagehelper.PageInfo;
import com.test.easyui.pojo.Cp;
import com.test.easyui.service.CpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CpController {
    @Autowired
    private CpService cpService;

    @RequestMapping("a.html")
    public String goList(HttpServletRequest request, String name, Integer page, Integer rows) {
        if (page == null || page < 1) {
            page = 1;
        }
        PageInfo<Cp> cpPageInfo = cpService.getAllCpByPageInfo(name, page, 2);
        request.setAttribute("cpPageInfo", cpPageInfo);
        return "index";
    }

    @RequestMapping("go_update.html")
    public String goUpdate(Integer id, HttpServletRequest request) {
        System.out.println(id+"************************************************");
        Cp cp = cpService.getCpById(id);
        request.setAttribute("cp", cp);
        return "update";
    }

    @RequestMapping("update.html")
    @ResponseBody
    public String update(Cp cp) {
        cpService.updateCpById(cp);
        return "ok";
    }

    @RequestMapping("list.html")
    @ResponseBody
    public Map<String, Object> list(Model model, String name, Integer page, Integer rows) {
        if (page == null || page < 1) {
            page = 1;
        }
        PageInfo<Cp> cpPageInfo = cpService.getAllCpByPageInfo(name, page, rows);
        Map<String, Object> map = new HashMap<>();
        map.put("total", cpPageInfo.getTotal());//一共多少条
        map.put("rows", cpPageInfo.getList());
        return map;
    }

    @RequestMapping("go_cp.html")
    public String goCp() {
        return "fragment";
    }





}

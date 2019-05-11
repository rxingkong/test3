package com.test.easyui.controller;

import com.test.easyui.pojo.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MenuController {
    @RequestMapping("menu.html")
    @ResponseBody
    public List<Menu> menus(){
        List<Menu> menus = new ArrayList<>();
        Menu root = new Menu(1,"系统管理");
        Menu menu2 = new Menu(2, "用户管理");
        menu2.getAttributes().put("url","a.html");
        Menu menu3 = new Menu(3, "角色管理");
        menu3.getAttributes().put("url","update.jsp");
        Menu menu4 = new Menu(4, "修改密码");
        menu4.getAttributes().put("url","go_cp.html");
        Menu menu5 = new Menu(5, "退出登陆");
        root.getChildren().add(menu2);
        root.getChildren().add(menu3);
        root.getChildren().add(menu4);
        menus.add(root);
        menus.add(menu5);
        return menus;
    }


}

package com.test.easyui.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.test.easyui.dao.CpDAO;
import com.test.easyui.pojo.Cp;
import com.test.easyui.service.CpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CpServiceImpl implements CpService{
    @Autowired
    private CpDAO cpDAO;

    @Override
    public Cp getCpById(Integer id) {
        return cpDAO.getCpById(id);
    }

    @Override
    public PageInfo<Cp> getAllCpByPageInfo(String name,Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return new PageInfo<>(cpDAO.getAllCp(name));
    }

    @Override
    public int updateCpById(Cp cp) {
        return cpDAO.updateCpById(cp);
    }

    @Override
    public List<Cp> getAllCp(String name) {
        return cpDAO.getAllCp(name);
    }
}

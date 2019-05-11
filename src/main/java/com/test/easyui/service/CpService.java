package com.test.easyui.service;

import com.github.pagehelper.PageInfo;
import com.test.easyui.pojo.Cp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CpService {
    List<Cp> getAllCp(@Param("name") String name);
    PageInfo<Cp> getAllCpByPageInfo(String name,Integer pageNum, Integer pageSize);
    Cp getCpById(Integer id);
    int updateCpById(Cp cp);
}

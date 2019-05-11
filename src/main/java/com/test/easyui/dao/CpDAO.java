package com.test.easyui.dao;

import com.test.easyui.pojo.Cp;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CpDAO {
    List<Cp> getAllCpByPageInfo(@Param("name") String name);
    List<Cp> getAllCp(@Param("name") String name);
    Cp getCpById(Integer id);
    int updateCpById(Cp cp);
}

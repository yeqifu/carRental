package com.yeqifu.stat.controller;

import com.yeqifu.stat.domain.BaseEntity;
import com.yeqifu.stat.service.IStatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 统计分析
 */
@RequestMapping("stat")
@Controller
public class StatController {

    @Autowired
    private IStatService statService;

    /**
     * 跳转到客户地区统计页面
     */
    @RequestMapping("toCustomerAreaStat")
    public String toCustomerAreaStat(){
        return "stat/customerAreaStat";
    }

    /**
     * 加载客户地区数据
     * @return
     */
    @RequestMapping("loadCustomerAreaStatJson")
    @ResponseBody
    public List<BaseEntity> loadCustomerAreaStatJson(){
        return this.statService.loadCustomerAreaStatList();
    }

    /**
     * 跳转到业务员年度业务统计
     * @return
     */
    @RequestMapping("toOpernameYearGradeStat")
    public String toOpernameYearGradeStat(){
        return "stat/opernameYearGradeStat";
    }

    /**
     * 加载业务员年度业务统计数据
     * @return
     */
    @RequestMapping("loadOpernameYearGradeStatJson")
    @ResponseBody
    public Map<String,Object> loadOpernameYearGradeStatJson(String year){
        List<BaseEntity> entities = this.statService.loadOpernameYearGradeStatList(year);
        Map<String,Object> map = new HashMap<String, Object>();
        List<String> names = new ArrayList<String>();
        List<Double> values = new ArrayList<Double>();
        for (BaseEntity baseEntity : entities) {
            names.add(baseEntity.getName());
            values.add(baseEntity.getValue());
        }
        map.put("name",names);
        map.put("value",values);
        return map;
    }

    /**
     * 跳转到公司年度业务统计
     * @return
     */
    @RequestMapping("toCompanyYearGradeStat")
    public String toCompanyYearGradeStat(){
        return "stat/companyYearGradeStat";
    }

    /**
     * 加载公司年度业务统计数据
     * @return
     */
    @RequestMapping("loadCompanyYearGradeStatJson")
    @ResponseBody
    public List<Double> loadCompanyYearGradeStatJson(String year){
        List<Double> entities = this.statService.loadCompanyYearGradeStatList(year);
        for (int i = 0; i < entities.size(); i++) {
            if (null==entities.get(i)){
                entities.set(i,0.0);
            }
        }
        return entities;
    }

}

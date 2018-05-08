package com.cn.stephen.echarts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn.stephen.echarts.model.WebResult;
import com.cn.stephen.echarts.service.ChartService;
import com.github.abel533.echarts.Option;


@Controller
@RequestMapping("/echarts")
public class EchartController {

	@Autowired
	private ChartService chartService;

	@RequestMapping("/home")
	public String home(){
		return "home";
	}
	
	@RequestMapping("/charts")
	public ModelAndView charts(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("main");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/barChart")
	public WebResult queryBarChart() {
		WebResult result = new WebResult();
		Option option = chartService.getBarChart(false);
		result.setData(option);
		System.out.println(option);
		return result;
	}
}

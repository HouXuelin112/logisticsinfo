package it.hxl.controller;

import it.hxl.po.*;
import it.hxl.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private LogisticsInfoService logisticsInfoService;
	@Autowired
	private CarInfoService carInfoService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private EnterpriseService enterpriseService;


	@RequestMapping("/selectEnterpriseWithConditions")
	@ResponseBody
	public String selectEnterpriseWithConditions(@RequestBody EnterpriseInfo enterpriseInfo, int flag, HttpSession session){
		List<EnterpriseInfo> enterpriseInfos;
		if (flag == 0){//全部
			enterpriseInfos = enterpriseService.findByEnterpriseInfo(enterpriseInfo);
		}else{
			enterpriseInfo.setUser((User)session.getAttribute("user"));
			enterpriseInfos = enterpriseService.findByEnterpriseInfo(enterpriseInfo);
		}
		session.setAttribute("enterpriseInfos", enterpriseInfos);
		return "ok";
	}

	@RequestMapping("/conditionEnterprise_list")
	public String conditionEnterprise_list(@RequestParam("id") int flag, HttpSession session){
		session.setAttribute("EFlag", flag);
		return "enterpriseInfo_list";
	}

	@RequestMapping("/handleAddEnterpriseInfo")
	public String handleAddEnterpriseInfo(EnterpriseInfo enterpriseInfo, HttpSession session){
		enterpriseInfo.setUser((User)session.getAttribute("user"));
		int row = enterpriseService.insertEnterprise(enterpriseInfo);
		if(row > 0){
			session.setAttribute("addState", "添加车辆信息成功");
		}else{
			session.setAttribute("addState", "添加失败");
		}
		return "redirect:enterprise_info";
	}

	@RequestMapping("/edit_enterpriseInfo")
	@ResponseBody
	public String edit_enterpriseInfo(@RequestBody EnterpriseInfo enterpriseInfo){
		enterpriseInfo.setUser(new User());
		int row = enterpriseService.updateEnterprise(enterpriseInfo);
		if(row > 0){
			return "ok";
		}
		return "error";
	}

	@RequestMapping("/deleteEnterpriseInfo")
	@ResponseBody
	public String deleteEnterpriseInfo(@RequestParam("id") int id){
		int row = enterpriseService.deleteById(id);
		if(row > 0){
			return "ok";
		}
		return "error";
	}

	@RequestMapping("/enterprise_info")
	public String toEnterprise_info(HttpSession session){
		List<User> users = userService.findAll();
		session.setAttribute("users", users);
		session.setAttribute("EFlag", 0);
		List<EnterpriseInfo> enterpriseInfos = enterpriseService.findAll();
		session.setAttribute("enterpriseInfos", enterpriseInfos);
		return "user/enterprise_info";
	}

	@RequestMapping("/addEnterpriseInfo")
	public String addEnterpriseInfo(HttpSession session){
		session.setAttribute("addDate", new Date());
		return "user/addEnterpriseInfo";
	}

	@RequestMapping("/find_enterpriseInfo")
	@ResponseBody
	public EnterpriseInfo find_enterpriseInfo(int id){
		return enterpriseService.findById(id);
	}


	@RequestMapping("/enterprise_list")
	public String enterprise_list(@RequestParam(value = "id", defaultValue = "0") int id, HttpSession session){
		session.setAttribute("EFlag", id);
		List<EnterpriseInfo> enterpriseInfos;
		if (id == 0){
			enterpriseInfos = enterpriseService.findAll();
		}else{
			enterpriseInfos = enterpriseService.findUserEnterprise((User)session.getAttribute("user"));
		}
		session.setAttribute("enterpriseInfos", enterpriseInfos);
		return "enterpriseInfo_list";
	}



	@RequestMapping("/selectGoodsWithConditions")
	@ResponseBody
	public String selectGoodsWithConditions(@RequestBody Goods goods, @RequestParam("flag") int flag, HttpSession session){
		List<Goods> goodss;
		if(flag == 0){
			User user = new User();
			goods.setUser(user);
			goodss = goodsService.findGoodsWithCondition(goods);
		}else{
			User user = (User)session.getAttribute("user");
			goods.setUser(user);
			goodss = goodsService.findGoodsWithCondition(goods);
		}
		if(goodss.size() == 0){
			String goodsName = goods.getGoodsName();
			String goodsStyle = goods.getGoodsStyle();
			session.setAttribute("zeroTip", "不存在" + (goodsName != "" ?"货物名称为：“" + goodsName + "”":"") + (goodsStyle != "" ?"货物类型为：“" + goodsStyle+"”":"") + "的货物！");
		}else {
			session.setAttribute("zeroTip", "");
		}
		session.setAttribute("goodsInfos", getGoodsInfos(goodss));
		return "ok";
	}

	@RequestMapping("/conditionGoods_list")
	public String conditionGoods_list(int id, HttpSession session){
		session.setAttribute("goodsFlag", id);
		return "goodsInfo_list";
	}

	@RequestMapping("/handleAddGoodsInfo")
	public String handleAddGoodsInfo(Goods goods, HttpSession session){
		goods.setUser((User)session.getAttribute("user"));
		int row = goodsService.insertGoods(goods);
		if(row > 0){
			session.setAttribute("addState", "添加车辆信息成功");
		}else{
			session.setAttribute("addState", "添加失败");
		}
		return "redirect:goods_info";
	}

	@RequestMapping("/addGoodsInfo")
	public String toAddGoods(HttpSession session){
		session.setAttribute("cars", carInfoService.findAllCars());
		session.setAttribute("addDate", new Date());
		return "user/addGoodsInfo";
	}

	@RequestMapping("/edit_goodsInfo")
	@ResponseBody
	public String edit_goodsInfo(@RequestBody Goods goods){
		int row = 0;
		try {
			 row = goodsService.updateGoods(goods);
		}catch (Exception e){
			e.printStackTrace();
		}

		if(row > 0){
			return "ok";
		}
		return "error";
	}

	@RequestMapping("/find_goodsInfo")
	@ResponseBody
	public Goods find_goodsInfo(int goods_id){
		Goods goods = goodsService.findGoodsById(goods_id);
		return goods;
	}

	@RequestMapping("/delete_goodsInfo")
	@ResponseBody
	public String delete_goodsInfo(@RequestParam("goods_id") int id){
		int row = goodsService.deleteGoodsById(id);
		if(row > 0){
			return "ok";
		}
		return "error";
	}

	@RequestMapping("/goodsInfo_list")
	public String goodsInfo_list(@RequestParam(name="id", defaultValue = "0")int id, HttpSession session){
		session.setAttribute("zeroTip", "");
		session.setAttribute("goodsFlag", id);
		List<Goods> goods;
		if(id == 0){
			goods = goodsService.findAllGoods();
		}else{
			goods = goodsService.findUserGoods(((User)session.getAttribute("user")).getId());
		}
		session.setAttribute("goodsInfos", getGoodsInfos(goods));
		return "goodsInfo_list";
	}

	@RequestMapping("/goods_info")
	public String toGood_info(HttpSession session){
		session.setAttribute("zeroTip", "");
		List<Goods> goods = goodsService.findAllGoods();
		session.setAttribute("goods", goods);
		List<Map<String, Goods>> goodsInfo = getGoodsInfos(goods);
		session.setAttribute("cars", carInfoService.findAllCars());
		session.setAttribute("goodsInfos", goodsInfo);
		session.setAttribute("goodsFlag", 0);
		return "user/goods_info";
	}

	private List<Map<String, Goods>> getGoodsInfos(List<Goods> goods){
		List<Map<String, Goods>> goodsInfos = new ArrayList<>();
		for (int i = 0; i < (int)(goods.size() / 2); i++){
			Map<String, Goods> map = new HashMap();
			map.put("left", goods.get(2 * i));
			map.put("right", goods.get(2 * i+1));
			goodsInfos.add(map);
		}
		if(goods.size() % 2 != 0){
			Map<String, Goods> map = new HashMap();
			map.put("left", goods.get(goods.size() - 1));
			goodsInfos.add(map);
		}
		return goodsInfos;
	}

	@RequestMapping(value = "/regist")
	public String handleRegist(User user, HttpServletResponse response, HttpSession session){
		if(userService.findUserByName(user.getUsername()) != null){
			session.setAttribute("msg", "注册失败,该用户已存在！");
			return "redirect:userLogin";
		}else {
			int row = userService.addUser(user);
			if (row <= 0) {
				session.setAttribute("msg", "注册失败");
				return "redirect:userLogin";
			}
			session.setAttribute("msg", "注册成功");
			Cookie cUsername = new Cookie("username", user.getUsername());
			Cookie cPassword = new Cookie("password", user.getPassword());
			cPassword.setPath("it/hxl/controller/UserController");
			cPassword.setMaxAge(30 * 60 * 24);
			cUsername.setPath("it/hxl/controller/UserController");
			cUsername.setMaxAge(30 * 60 * 24);
			response.addCookie(cUsername);
			response.addCookie(cPassword);
			return "redirect:userLogin";
		}
	}
	
	@RequestMapping("/userLogin")
	public String toUserLogin() {
		return "user/userLogin";
	}

	@RequestMapping("/handleLogin")
	public String handleLogin(HttpSession session, HttpServletResponse response, @RequestParam("username") String username, @RequestParam("password") String password, @RequestParam(name="rem", required = false) String rem){
		if("".equals(username) || "".equals(password)){
			session.setAttribute("msg", "请输入完整的用户名或密码");
			return "redirect:userLogin";
		}
		User user = userService.findUser(username, password);
		if(user == null){
			session.setAttribute("msg", "用户名或密码错误");
			return "redirect:userLogin";
		}
		if("rem".equals(rem)){
			//如果勾选记住密码则将用户名密码放入cookie传到浏览器
			Cookie crem = new Cookie("rem", rem);
			Cookie cUsername = new Cookie("username", user.getUsername());
			Cookie cPassword = new Cookie("password", user.getPassword());
			cPassword.setPath("it/hxl/controller/UserController");
			cPassword.setMaxAge(30 * 60 * 24);
			crem.setPath("it/hxl/controller/UserController");
			crem.setMaxAge(30 * 60 * 24);
			cUsername.setPath("it/hxl/controller/UserController");
			cUsername.setMaxAge(30 * 60 * 24);
			response.addCookie(cUsername);
			response.addCookie(crem);
			response.addCookie(cPassword);
		}else{
			//否则将用户名名密码置空
			Cookie cUsername = new Cookie("username", "");
			Cookie cPassword = new Cookie("password", "");
			Cookie crem = new Cookie("rem", "");
			cPassword.setPath("it/hxl/controller/UserController");
			cPassword.setMaxAge(30 * 60 * 24);
			cUsername.setPath("it/hxl/controller/UserController");
			cUsername.setMaxAge(30 * 60 * 24);
			crem.setPath("it/hxl/controller/UserController");
			crem.setMaxAge(30 * 60 * 24);
			response.addCookie(cUsername);
			response.addCookie(cPassword);
			response.addCookie(crem);
		}

		List<Admin> admins = adminService.findAllAdmin();
		LogisticsInfo logisticsInfo1 = new LogisticsInfo();
		logisticsInfo1.setAdmin(new Admin());
		List<LogisticsInfo> logisticsInfos = logisticsInfoService.findAllLogisticsInfo(logisticsInfo1);
		session.setAttribute("admins", admins);
		session.setAttribute("logisticsInfos", logisticsInfos);
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(60 * 24 * 30);
		return "user/main";
	}

	@RequestMapping("/detail")
	@ResponseBody
	public LogisticsInfo findDetail(@RequestBody LogisticsInfo logisticsInfo1){
		return logisticsInfoService.findAllLogisticsInfo(logisticsInfo1).get(0);
	}

	@RequestMapping("/main")
	public String toMain(){
		return "user/main";
	}

	@RequestMapping("/delete_carInfo")
	@ResponseBody
	public String delete_carInfo(@RequestParam("car_id") int id){
		int flag = carInfoService.deleteCarById(id);
		if(flag > 0){
			return "ok";
		}else {
			return "error";
		}
	}

	@RequestMapping("/edit_carInfo")
	@ResponseBody
	public String edit_carInfo(@RequestBody Car car){

		int row = carInfoService.updateCarById(car);
		if (row <= 0) {
			return "error";
		} else {
			return "ok";
		}
	}

	@RequestMapping("/find_carInfo")
	@ResponseBody
	public Car find_carInfo(@RequestParam("car_id")int id){
		Car car = carInfoService.findCarById(id);
		return car;
	}

	@RequestMapping("/carInfo_list")
	public String toCarInfo(@RequestParam(name = "id", defaultValue = "0") String id, HttpSession session){
		List<Car> cars;
		session.setAttribute("flag", id);
		if (Integer.parseInt(id) == 0) {
			cars = carInfoService.findAllCars();
		}else{
			cars = carInfoService.findUserCars(((User)session.getAttribute("user")).getId());
		}
		session.setAttribute("carInfos", getCarInfos(cars));
		return "carInfo_list";
	}

	@RequestMapping("/addCarInfo")
	public String toAddCarInfo(HttpSession session){
		session.setAttribute("addDate", new Date());
		return "user/addCarInfo";
	}

	@RequestMapping("/handleAddCarInfo")
	public String handAddCarInfo(Car car, HttpSession session){
		car.setUser((User)session.getAttribute("user"));
		int row = carInfoService.insertCar(car);
		if(row > 0){
			session.setAttribute("addState", "添加车辆信息成功");
		}else{
			session.setAttribute("addState", "添加失败");
		}
		return "redirect:car_info";
	}

	@RequestMapping("/selectWithConditions")
	@ResponseBody
	public String selectWithConditions(@RequestBody Car car, @RequestParam("flag") int flag, HttpSession session){
		List<Car> cars;
		if(flag == 0){
			User user = new User();
			car.setUser(user);
			cars = carInfoService.findCarsWithConditions(car);
		}else{
			User user = (User)session.getAttribute("user");
			car.setUser(user);
			cars = carInfoService.findCarsWithConditions(car);
		}
		session.setAttribute("carInfos", getCarInfos(cars));
		return "ok";
	}

	@RequestMapping("/conditionCar_list")
	public String conditionCar_list(int id, HttpSession session){
		session.setAttribute("flag", id);
		return "carInfo_list";
	}

	@RequestMapping("/car_info")
	public String toCar_info(HttpSession session){
		//获取所有车辆信息
		List<Car> cars = carInfoService.findAllCars();
		session.setAttribute("cars", cars);
		List<Map<String, Car>> carInfos = getCarInfos(cars);
		session.setAttribute("carInfos", carInfos);
		session.setAttribute("flag", 0);
		return "user/car_info";
	}

	private List<Map<String, Car>> getCarInfos(List<Car> cars){
		List<Map<String, Car>> carInfos = new ArrayList<>();
		for (int i = 0; i < (int)(cars.size() / 2); i++){
			Map<String, Car> map = new HashMap();
			map.put("left", cars.get(2 * i));
			map.put("right", cars.get(2 * i+1));
			carInfos.add(map);
		}
		if(cars.size() % 2 != 0){
			Map<String, Car> map = new HashMap();
			map.put("left", cars.get(cars.size() - 1));
			carInfos.add(map);
		}
		return carInfos;
	}


	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "user/userLogin";
	}

	@RequestMapping("/findLogisticsInfos")
	@ResponseBody
	public List<LogisticsInfo> findLogisticsInfos(@RequestBody LogisticsInfo logisticsInfo){
		return logisticsInfoService.findAllLogisticsInfo(logisticsInfo);
	}

	@RequestMapping("/findAllLogis")
	@ResponseBody
	public List<LogisticsInfo> findAllLogis(){
		LogisticsInfo logisticsInfo1 = new LogisticsInfo();
		logisticsInfo1.setAdmin(new Admin());
		return logisticsInfoService.findAllLogisticsInfo(logisticsInfo1);
	}

	@RequestMapping("/findPassword")
	public String findPassword(String username, HttpSession session){
		User user = userService.findUserByName(username);
		if(user == null){
			session.setAttribute("msg", "该用户不存在");
			return "redirect:userLogin";
		}
		session.setAttribute("question", user.getQuestion());
		session.setAttribute("result", user.getResult());
		session.setAttribute("username", username);
		return "user/findPassword";
	}

	@RequestMapping("/checkResult")
	@ResponseBody
	public String checkResult(String result, HttpSession session){
		if(result.equals(session.getAttribute("result"))){
			return "ok";
		}else{
			return "error";
		}
	}

	@RequestMapping("/changePassword")
	@ResponseBody
	public String changePassword(String newPassword, HttpSession session, HttpServletResponse response){
		User user = userService.findUserByName((String)session.getAttribute("username"));
		user.setPassword(newPassword);
		int row = userService.updateUser(user);
		if(row > 0){
			Cookie un = new Cookie("username", user.getUsername());
			Cookie psd = new Cookie("password", user.getPassword());
			un.setMaxAge(60 * 60 *24 *30);
			psd.setMaxAge(3600 * 24 *30);
			psd.setPath("it/hxl/controller/UserController");
			un.setPath("it/hxl/controller/UserController");
			response.addCookie(un);
			response.addCookie(psd);
			return "ok";
		}
		return "error";
	}

}

package com.market.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.market.fileupload.FileUpload;
import com.market.service.MainService;
import com.market.vo.CategoryVO;
import com.market.vo.PageNumber;
import com.market.vo.Paging;
import com.market.vo.ProductsVO;
import com.market.vo.ReplyVO;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/main/*")
public class MainController{
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	MainService mainService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	static int num; //to get a product num
	static boolean check; //to increase hit properly
	
	//to upload a new product
	@RequestMapping(value = "/product/write", method = RequestMethod.GET)
	public void getGoodsRegister(Model model) throws Exception {
		logger.info("get goods register");
		
		List<CategoryVO> category = mainService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		check = false;
	}
	
	//create a new product
	@RequestMapping(value = "/product/write", method = RequestMethod.POST)
	public String postProductWrite(ProductsVO vo, MultipartFile file) throws Exception{
		
		//upload image in the folder name, image_resources
		String path = uploadPath + File.separator + "image_resources";
		String yPath = FileUpload.calcPath(path);
		String name = "";
		check = false;
		
		if(file != null) {
			name =  FileUpload.fileUpload(path, file.getOriginalFilename(), file.getBytes(), yPath); 
		} 

		vo.setImage(File.separator + "image_resources" + yPath + File.separator + name);
		vo.setThumbnail(File.separator + "image_resources" + yPath + File.separator + "s" + File.separator + "s_" + name);
		
		mainService.write(vo);
		
		String code = vo.getCategory_code();
		String address = "";

		//go to the product's category page
		logger.info("modified" + " " + code);
		if(code.equals("100"))
			address =  "/product/toys";
		else if(code.equals("200"))
			address =  "/product/clothes";
		else if(code.equals("300"))
			address =  "/product/fruits";
		else if(code.equals("400"))
			address =  "/product/electronics";
		if(code.equals("500"))
			address =  "/product/shoes";
		
		return "redirect:/main" + address;
	}
	
	//see all products
	@RequestMapping(value = "/product/view", method = RequestMethod.GET)
	public void getProductList(Model model, Paging p) throws Exception{
		logger.info("show all categories");
		
		
		model.addAttribute("list",mainService.list(p));
		//calculate pages
		PageNumber pageNumber = new PageNumber();
		pageNumber.setP(p);
		pageNumber.setTotal(mainService.listCount());
		model.addAttribute("pageNumber",pageNumber);
		check = false;
	}
	
	//products for each category
	@RequestMapping(value = "/product/toys", method = RequestMethod.GET)
	public void getToysList(Model model, Paging p) throws Exception{
		logger.info("toys list");
		
		model.addAttribute("list",mainService.Toylist(p));
		PageNumber pageNumber = new PageNumber();
		pageNumber.setP(p);
		pageNumber.setTotal(mainService.ToyCount());
		model.addAttribute("pageNumber",pageNumber);
		check = false;
	}
	
	@RequestMapping(value = "/product/clothes", method = RequestMethod.GET)
	public void getClothesList(Model model, Paging p) throws Exception{
		logger.info("clothes list");
		
		model.addAttribute("list",mainService.Clothlist(p));
		PageNumber pageNumber = new PageNumber();
		pageNumber.setP(p);
		pageNumber.setTotal(mainService.ClothCount());
		model.addAttribute("pageNumber",pageNumber);
		check = false;
	}
	
	@RequestMapping(value = "/product/fruits", method = RequestMethod.GET)
	public void getFruitsList(Model model, Paging p) throws Exception{
		logger.info("fruits list");
		
		model.addAttribute("list",mainService.Fruitlist(p));
		PageNumber pageNumber = new PageNumber();
		pageNumber.setP(p);
		pageNumber.setTotal(mainService.FruitCount());
		model.addAttribute("pageNumber",pageNumber);
		check = false;
	}
	
	@RequestMapping(value = "/product/electronics", method = RequestMethod.GET)
	public void getElectronicsList(Model model, Paging p) throws Exception{
		logger.info("electronics list");
		
		model.addAttribute("list",mainService.Electroniclist(p));
		PageNumber pageNumber = new PageNumber();
		pageNumber.setP(p);
		pageNumber.setTotal(mainService.ElectronicCount());
		model.addAttribute("pageNumber",pageNumber);
		check = false;
	}
	
	@RequestMapping(value = "/product/shoes", method = RequestMethod.GET)
	public void getShoesList(Model model, Paging p) throws Exception{
		logger.info("shoes list");
		
		model.addAttribute("list",mainService.Shoelist(p));
		PageNumber pageNumber = new PageNumber();
		pageNumber.setP(p);
		pageNumber.setTotal(mainService.ShoeCount());
		model.addAttribute("pageNumber",pageNumber);
		check = false;
	}
	
	//see a specific product
	@RequestMapping(value = "/product/detail", method = RequestMethod.GET)
	public void getProductDetail(@RequestParam("num") int product_num, Model model) throws Exception{
		logger.info("show a product detail");
		//hit is increased only if check is false, prevent increasing from F5
		if(!check)
		{
			mainService.hit(product_num);
			check = true;
		}
		
		ProductsVO product = mainService.productDetail(product_num);
		num = product_num;//copy product_num for replies
		
		model.addAttribute("product", product);
		model.addAttribute("replyCount",mainService.ReplyCount(product_num));
		 
	}
	
	
	//modify product's information
	@RequestMapping(value = "/product/modify", method = RequestMethod.GET)
	public void getProductModify(@RequestParam("num") int product_num, Model model) throws Exception{
		logger.info("modifying");
		
		ProductsVO product = mainService.productDetail(product_num);
		model.addAttribute("product", product);
		
		List<CategoryVO> category = mainService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		check = true;
	}
	
	//save modified information
	@RequestMapping(value = "/product/modify", method = RequestMethod.POST)
	public String postProductModify(@RequestParam("num") int product_num, Model model,ProductsVO vo, MultipartFile file, HttpServletRequest req) throws Exception{
		logger.info("modified" + " " + product_num);
		
		
		vo.setProduct_num(product_num);
		ProductsVO product = mainService.productDetail(product_num);
		model.addAttribute("product", product);
		
		
		// delete a previous image, and replace to a new image
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {

		  new File(uploadPath + req.getParameter("image")).delete();
		  new File(uploadPath + req.getParameter("thumbnail")).delete();
		  
		  String path = uploadPath + File.separator + "image_resources";
		  String yPath = FileUpload.calcPath(path);
		  String name = FileUpload.fileUpload(path, file.getOriginalFilename(), file.getBytes(), yPath);
		  
		  vo.setImage(File.separator + "image_resources" + yPath + File.separator + name);
		  vo.setThumbnail(File.separator + "image_resources" + yPath + File.separator + "s" + File.separator + "s_" + name);
		  
		 } else {  //no new image, use an old image instead
		  vo.setImage(req.getParameter("image"));
		  vo.setThumbnail(req.getParameter("thumbnail"));
		  
		 }
		 
		mainService.productModify(vo);
		check = true;
		System.out.println(product_num);
		String code = vo.getCategory_code();
		String address = "";

		logger.info("modified" + " " + code);
		if(code.equals("100"))
			address =  "/product/toys";
		else if(code.equals("200"))
			address =  "/product/clothes";
		else if(code.equals("300"))
			address =  "/product/fruits";
		else if(code.equals("400"))
			address =  "/product/electronics";
		if(code.equals("500"))
			address =  "/product/shoes";
		
		return "redirect:/main" + address;
	}
	
	//delete a product
	@RequestMapping(value = "/product/delete", method = RequestMethod.POST)
	public String postProducDelete(@RequestParam("num") int product_num) throws Exception{
		logger.info("Deleted" + " " + product_num);
		
		ProductsVO product = mainService.productDetail(product_num);
		String code = product.getCategory_code();
		String address = "";
		
		mainService.productDelete(product_num);
		check = false;
		

		logger.info("modified" + " " + code);
		if(code.equals("100"))
			address =  "/product/toys";
		else if(code.equals("200"))
			address =  "/product/clothes";
		else if(code.equals("300"))
			address =  "/product/fruits";
		else if(code.equals("400"))
			address =  "/product/electronics";
		if(code.equals("500"))
			address =  "/product/shoes";
		
		return  "redirect:/main" + address;
	}
	
	
	//comment on the product
	@ResponseBody
	@RequestMapping(value = "/detail/writeReply", method = RequestMethod.POST)
	public void registReply(ReplyVO vo, HttpSession session,Model model) throws Exception {
	 logger.info("regist reply");
	 
	 ReplyVO reply = (ReplyVO)session.getAttribute("reply");
	 vo.setProduct_num(num);//num is a product_num, it copes from getProductDetail
	 mainService.reply(vo);
	} 
	
	//show all replies
	@ResponseBody
	@RequestMapping(value = "/detail/showReplies", method = RequestMethod.GET)
	public List<ReplyVO> getReplies(@RequestParam("num") int product_num,Model model) throws Exception {
	 logger.info("show Replies");
	   
	 List<ReplyVO> replies = mainService.showReplies(product_num);

	 return replies;
	} 
	
	
	//modify replies
	@RequestMapping(value = "/product/replyModify", method = {RequestMethod.POST,RequestMethod.GET})
	public String replyModify(ReplyVO vo) throws Exception{
		logger.info("modifying reply");
		
		vo.setProduct_num(num);
		logger.info("" + vo.getReply_num() + " " + vo.getUserOpinion());
		mainService.replyModify(vo);
		
		return "redirect:/main/product/detail?num=" + num;
	}
	
	@RequestMapping(value = "/product/replyDelete", method = {RequestMethod.POST,RequestMethod.GET})
	public String postReplyDelete(@RequestParam("reply_num") int reply_num) throws Exception{
		logger.info("Deleted" + " " + reply_num);
		
		mainService.replyDelete(reply_num);
		check = false;
		return "redirect:/main/product/detail?num=" + num;
	}
	
	
}
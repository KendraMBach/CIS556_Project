package org.o7planning.springmvconlinestore.controller;
 
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.o7planning.springmvconlinestore.dao.BirthstoneDAO;
import org.o7planning.springmvconlinestore.dao.CharmDAO;
import org.o7planning.springmvconlinestore.dao.CustomerDAO;
import org.o7planning.springmvconlinestore.dao.OrderDAO;
import org.o7planning.springmvconlinestore.dao.ProductDAO;
import org.o7planning.springmvconlinestore.entity.Birthstone;
import org.o7planning.springmvconlinestore.entity.Charm;
import org.o7planning.springmvconlinestore.entity.Customer;
import org.o7planning.springmvconlinestore.entity.Order;
import org.o7planning.springmvconlinestore.entity.Product;
import org.o7planning.springmvconlinestore.model.CustomerInfo;
import org.o7planning.springmvconlinestore.model.OrderDetailInfo;
import org.o7planning.springmvconlinestore.model.OrderInfo;
import org.o7planning.springmvconlinestore.model.PaginationResult;
import org.o7planning.springmvconlinestore.model.ProductInfo;
import org.o7planning.springmvconlinestore.validator.ProductInfoValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
 
@Controller
// Enable Hibernate Transaction.
@Transactional
// Need to use RedirectAttributes
@EnableWebMvc
public class AdminController {
 
    @Autowired
    private OrderDAO orderDAO;
 
    @Autowired
    private ProductDAO productDAO;
    
    @Autowired
    private CustomerDAO accountDAO;
    
    @Autowired
    private BirthstoneDAO birthstoneDAO;
    
    @Autowired
    private CharmDAO charmDAO;
 
    @Autowired
    private ProductInfoValidator productInfoValidator;
 
    // Configurated In ApplicationContextConfig.
    @Autowired
    private ResourceBundleMessageSource messageSource;
 
    @InitBinder
    public void myInitBinder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        System.out.println("Target=" + target);
 
        if (target.getClass() == ProductInfo.class) {
            dataBinder.setValidator(productInfoValidator);
            // For upload Image.
            dataBinder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
        }
    }
 
    // GET: Show Login Page
    @RequestMapping(value = { "/login" }, method = RequestMethod.GET)
    public String login(Model model) {
    	CustomerInfo user = new CustomerInfo();
    	model.addAttribute("user", user);
        return "login";
    }
    
    
 // POST: Show Login Page
    @RequestMapping(value = { "/login" }, method = RequestMethod.POST)
    @Transactional(propagation = Propagation.NEVER)
    public String confirmLogin(HttpServletRequest request, Model model, //
    	    @ModelAttribute("user") @Validated CustomerInfo userInfo, //
    	    BindingResult result, //
    	    final RedirectAttributes redirectAttributes) {
    	
    	if (result.hasErrors()) {
            return "login";
        }
    	try {
    		Customer customer = accountDAO.findAccountWithPass(userInfo.getEmail(), userInfo.getPassword());
        if(customer == null) {
        	String message = "Invalid Credentials";
            model.addAttribute("message", message);
            return "login";
        	}
    	}
    	catch (Exception e) {
            
            String message = e.getMessage();
            model.addAttribute("message", message);
            return "login";
    	}
    	
    	
        return "redirect:/";
    	
    }
    
 
    @RequestMapping(value = { "/accountInfo" }, method = RequestMethod.GET)
    public String accountInfo(Model model) {
 
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println(userDetails.getPassword());
        System.out.println(userDetails.getUsername());
        System.out.println(userDetails.isEnabled());
 
        model.addAttribute("userDetails", userDetails);
        return "accountInfo";
    }
 
    @RequestMapping(value = { "/orderList" }, method = RequestMethod.GET)
    public String orderList(Model model, //
            @RequestParam(value = "page", defaultValue = "1") String pageStr) {
        int page = 1;
        try {
            page = Integer.parseInt(pageStr);
        } catch (Exception e) {
        }
        final int MAX_RESULT = 5;
        final int MAX_NAVIGATION_PAGE = 10;
 
        PaginationResult<OrderInfo> paginationResult //
        = orderDAO.listOrderInfo(page, MAX_RESULT, MAX_NAVIGATION_PAGE);
 
        model.addAttribute("paginationResult", paginationResult);
        return "orderList";
    }
 
    // GET: Show product.
    @RequestMapping(value = { "/product" }, method = RequestMethod.GET)
    public String product(Model model, @RequestParam(value = "code", defaultValue = "") String code) {
        ProductInfo productInfo = null;
        List<String> sizes = null;
        Product thisProduct = null;
        
        int engraving = 0;
        List<Birthstone> birthstones = null;
        List<Charm> charms = null;
 
        if (code != null && code.length() > 0) {
        	
            productInfo = productDAO.findProductInfo(Integer.parseInt(code));
            sizes = productDAO.allSizes(productInfo.getName());
            thisProduct = productDAO.findProduct(Integer.valueOf(code));
            
         
            
            if(thisProduct.getOptEngrave() != 0) {
            	engraving = 1;
            }
            if(thisProduct.getOptBirthstone() != 0) {
            	birthstones = birthstoneDAO.retrieveAll();
            }
            if(thisProduct.hasCharmOpt()) {
            	
            	charms = charmDAO.getCharmList();
            	
            	
            }
        }
        if (productInfo == null) {
            productInfo = new ProductInfo();
            //productInfo.setNewProduct(true);
        }
        
        
        model.addAttribute("productForm", productInfo);
        model.addAttribute("sizes", sizes);
        model.addAttribute("engraving", engraving);
        model.addAttribute("birthstones", birthstones);
        model.addAttribute("charm1", thisProduct.getOptCharm1());
        model.addAttribute("charm2", thisProduct.getOptCharm2());
        model.addAttribute("charm3", thisProduct.getOptCharm3());
        model.addAttribute("charm4", thisProduct.getOptCharm4());
        model.addAttribute("charmList", charms);
        model.addAttribute("gender", thisProduct.getGender());
        return "product";
    }
 
    // POST: Save product
    @RequestMapping(value = { "/product" }, method = RequestMethod.POST)
    // Avoid UnexpectedRollbackException (See more explanations)
    @Transactional(propagation = Propagation.NEVER)
    public String productSave(Model model, //
            @ModelAttribute("productForm") @Validated ProductInfo productInfo, //
            BindingResult result, //
            final RedirectAttributes redirectAttributes) {
 
        if (result.hasErrors()) {
            return "product";
        }
        try {
        	
            productDAO.save(productInfo);
        } catch (Exception e) {
            // Need: Propagation.NEVER?
            String message = e.getMessage();
            model.addAttribute("message", message);
            // Show product form.
            return "product";
 
        }
        return "redirect:/productList";
    }
 
    @RequestMapping(value = { "/order" }, method = RequestMethod.GET)
    public String orderView(Model model, @RequestParam("orderId") String orderId) {
        Order orderInfo = null;
        if (orderId != null) {
            orderInfo = this.orderDAO.findSingleOrder(Integer.parseInt(orderId));
        }
        if (orderInfo == null) {
            return "redirect:/orderList";
        }
        List<Order> details = this.orderDAO.listAllOrderItemsForSingleOrder(Integer.parseInt(orderId));
        //orderInfo.setDetails(details);
 
        model.addAttribute("orderInfo", orderInfo);
        model.addAttribute(details);
 
        return "order";
    }
    
}
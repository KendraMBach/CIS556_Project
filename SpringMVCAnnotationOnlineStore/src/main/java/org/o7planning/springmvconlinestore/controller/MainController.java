package org.o7planning.springmvconlinestore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.o7planning.springmvconlinestore.dao.BirthstoneDAO;
import org.o7planning.springmvconlinestore.dao.CharmDAO;
import org.o7planning.springmvconlinestore.dao.CustomerDAO;
import org.o7planning.springmvconlinestore.dao.OrderDAO;
import org.o7planning.springmvconlinestore.dao.ProductDAO;
import org.o7planning.springmvconlinestore.dao.ShippingCostsDAO;
import org.o7planning.springmvconlinestore.entity.Birthstone;
import org.o7planning.springmvconlinestore.entity.Charm;
import org.o7planning.springmvconlinestore.entity.Customer;
import org.o7planning.springmvconlinestore.entity.Order;
import org.o7planning.springmvconlinestore.entity.Product;
import org.o7planning.springmvconlinestore.entity.ShippingCost;
import org.o7planning.springmvconlinestore.model.CartInfo;
import org.o7planning.springmvconlinestore.model.CustomerInfo;
import org.o7planning.springmvconlinestore.model.OrderInfo;
import org.o7planning.springmvconlinestore.model.PaginationResult;
import org.o7planning.springmvconlinestore.model.ProductInfo;
import org.o7planning.springmvconlinestore.util.Utils;
import org.o7planning.springmvconlinestore.validator.CustomerInfoValidator;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
 
@Controller
// Enable Hibernate Transaction.
@Transactional
// Need to use RedirectAttributes
@EnableWebMvc
public class MainController {
 
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
    private CustomerDAO customerDAO;
    
    @Autowired
    private ShippingCostsDAO shippingCostsDAO;
 
    @Autowired
    private CustomerInfoValidator customerInfoValidator;
 
    @InitBinder
    public void myInitBinder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        System.out.println("Target=" + target);
 
        // For Cart Form.
        // (@ModelAttribute("cartForm") @Validated CartInfo cartForm)
        if (target.getClass() == CartInfo.class) {
 
        }
        // For Customer Form.
        // (@ModelAttribute("customerForm") @Validated CustomerInfo
        // customerForm)
        else if (target.getClass() == CustomerInfo.class) {
            dataBinder.setValidator(customerInfoValidator);
        }
 
    }
 
    @RequestMapping("/403")
    public String accessDenied() {
        return "/403";
    }
 
    @RequestMapping("/")
    public String home() {
        return "index";
    }
 
 // Initial Product List page.
    @RequestMapping(value = { "/productList" }, method = {RequestMethod.GET, RequestMethod.POST})
    public String listProductHandler(HttpServletRequest request, Model model, //
            @RequestParam(value = "name", defaultValue = "") String likeName,
            @RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "filter", // 
            defaultValue = "all") String filter) {
    	PaginationResult<ProductInfo> result = null;
    	String subCategory = "";
    	
        final int maxResult = 6;
        final int maxNavigationPage = 10;

        List<String> type = Arrays.asList(filter.split(","));
        String mainCategory = type.get(0);
        if(type.size() > 1) {
        	subCategory = type.get(1);
        	
        	result = productDAO.queryBySubCategoryProducts(page, maxResult, maxNavigationPage, likeName, mainCategory, subCategory);
        }
        else if(mainCategory.equals("all")) {
        result = productDAO.queryProducts(page, //
                maxResult, maxNavigationPage, likeName);
        }
        else if(mainCategory.equals("popular")) {
        	//Display Popular Hack
        	
        	List<ProductInfo> popularResult =  new ArrayList<ProductInfo>();
        	
        	List<Product> test = orderDAO.listAllOrderItemsForAllOrders();
        	for(int i=0; i<6; i++) {
        		{
        		ProductInfo productInfo = new ProductInfo(test.get(i));
        			popularResult.add(productInfo);
        		}
        		result = new PaginationResult(popularResult);
        		 
        	}
        }
        else {
        	result = productDAO.queryCategoryProducts(page, maxResult, maxNavigationPage, likeName, mainCategory);
        }
        
        model.addAttribute("paginationProducts", result);
        model.addAttribute("filter", filter);
        model.addAttribute("mainCategory", mainCategory);
        model.addAttribute("subCategory", subCategory);
        return "productList";
    }
    
    @RequestMapping(value = { "/productSearch" }, method = {RequestMethod.GET})
    public String searchProductHandler(HttpServletRequest request, Model model, //
            @RequestParam(defaultValue = "") String likeName,
            @RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "filter", // 
            defaultValue = "all") String filter) {
    	
    		final int maxResult = 6;
    		final int maxNavigationPage = 10;
    		PaginationResult<ProductInfo> result = null;
    	
    		result = productDAO.queryProducts(page, maxResult, maxNavigationPage, likeName);
    	
	    	model.addAttribute("paginationProducts", result);
	        model.addAttribute("filter", "");
	        model.addAttribute("mainCategory", "");
	        model.addAttribute("subCategory", "");
    	
				return "productList";
    	
    }
    
 // New User Registration.
    @RequestMapping(value = {"/register" }, method = RequestMethod.GET)
    public String newUserRegistration(Model model) {
    	
        CustomerInfo newUser = new CustomerInfo();
        List<ShippingCost> states = shippingCostsDAO.getStateList();
 
        model.addAttribute("newUserForm", newUser);
        model.addAttribute("states", states);
        return "register";
    }
    
 // POST: Process new user.
    @RequestMapping(value = { "/register" }, method = RequestMethod.POST)
    @Transactional(propagation = Propagation.NEVER)
    public String processNewUser(HttpServletRequest request, //
            Model model, //
            @ModelAttribute("newUserForm") @Validated CustomerInfo userInfo, //
            BindingResult result, //
            final RedirectAttributes redirectAttributes) {
    	

        if (result.hasErrors()) {
            return "register";
        }
    	try {
        accountDAO.registerNewUser(userInfo);
    	}
    	catch (Exception e) {
            
            String message = e.getMessage();
            model.addAttribute("message", message);
            return "register";
    	}
        return "redirect:/";
    	
    }
    
    @RequestMapping({ "/buyProduct" })
    public String listProductHandler(HttpServletRequest request, Model model, //
            @RequestParam(value = "code", defaultValue = "") int code, @ModelAttribute("productForm") //
    		ProductInfo prodInfo, BindingResult result) {
    		
    	
        Product product = null;
        if (code > 0) {
            product = productDAO.findProduct(code);
        }
        if (product != null) {
        	Double totalPrice = 0.00;
			
            // Cart info stored in Session.
            CartInfo cartInfo = Utils.getCartInSession(request);
 
            ProductInfo productInfo = new ProductInfo(product);
            
            
           //Update user selections
            productInfo.setSize(request.getParameter("size"));
            
            if(request.getParameter("engraving") != null)
            {
            	productInfo.setEngraving(request.getParameter("engraving"));
            }
            if(request.getParameter("birthstone") != null) {
	            Birthstone birthstone = birthstoneDAO.findOne(Integer.valueOf(request.getParameter("birthstone")));
	            productInfo.setBirthstoneSelected(birthstone);
	            totalPrice += birthstone.getCost();
            }
            if(request.getParameter("charm1") != null) {
            	Charm charm1 = charmDAO.findOne(Integer.valueOf(request.getParameter("charm1")));
            	productInfo.setCharmSelected1(charm1);
            	totalPrice += charm1.getCost();
            }
            if(request.getParameter("charm2") != null) {
            	Charm charm2 = charmDAO.findOne(Integer.valueOf(request.getParameter("charm2")));
            	productInfo.setCharmSelected2(charm2);
            	totalPrice += charm2.getCost();
            }
            if(request.getParameter("charm3") != null) {
            	Charm charm3 = charmDAO.findOne(Integer.valueOf(request.getParameter("charm3")));
            	productInfo.setCharmSelected3(charm3);
            	totalPrice += charm3.getCost();
            }
            if(request.getParameter("charm4") != null) {
            	Charm charm4 = charmDAO.findOne(Integer.valueOf(request.getParameter("charm4")));
            	productInfo.setCharmSelected4(charm4);
            	totalPrice += charm4.getCost();
            }
            productInfo.setTotalOptionsPrice(totalPrice);
            cartInfo.addProduct(productInfo, 1);
        }
        // Redirect to shoppingCart page.
        return "redirect:/shoppingCart";
    }
 
    @RequestMapping({ "/shoppingCartRemoveProduct" })
    public String removeProductHandler(HttpServletRequest request, Model model, //
            @RequestParam(value = "code", defaultValue = "") int code) {
        Product product = null;
        if (code > 0) {
            product = productDAO.findProduct(code);
        }
        if (product != null) {
 
            // Cart Info stored in Session.
            CartInfo cartInfo = Utils.getCartInSession(request);
 
            ProductInfo productInfo = new ProductInfo(product);
 
            cartInfo.removeProduct(productInfo);
 
        }
        // Redirect to shoppingCart page.
        return "redirect:/shoppingCart";
    }
 
    // POST: Update quantity of products in cart.
    @RequestMapping(value = { "/shoppingCart" }, method = RequestMethod.POST)
    public String shoppingCartUpdateQty(HttpServletRequest request, //
            Model model, //
            @ModelAttribute("cartForm") CartInfo cartForm) {
 
        CartInfo cartInfo = Utils.getCartInSession(request);
        cartInfo.updateQuantity(cartForm);
 
        // Redirect to shoppingCart page.
        return "redirect:/shoppingCart";
    }
 
    // GET: Show Cart
    @RequestMapping(value = { "/shoppingCart" }, method = RequestMethod.GET)
    public String shoppingCartHandler(HttpServletRequest request, Model model) {
        CartInfo myCart = Utils.getCartInSession(request);
        Double total = myCart.getAmountTotal();
        
        model.addAttribute("cartForm", myCart);
        model.addAttribute("total", total);
        return "shoppingCart";
    }
 
    // GET: Enter customer information.
    @RequestMapping(value = { "/shoppingCartCustomer" }, method = RequestMethod.GET)
    public String shoppingCartCustomerForm(HttpServletRequest request, Model model) {
 
        CartInfo cartInfo = Utils.getCartInSession(request);
      
        // Cart is empty.
        if (cartInfo.isEmpty()) {
             
            // Redirect to shoppingCart page.
            return "redirect:/shoppingCart";
        }
 
        CustomerInfo customerInfo = cartInfo.getCustomerInfo();
        if (customerInfo == null) {
            customerInfo = new CustomerInfo();
        }
 
        model.addAttribute("customerForm", customerInfo);
 
        return "shoppingCartCustomer";
    }
 
    // POST: Save customer information.
    @RequestMapping(value = { "/shoppingCartCustomer" }, method = RequestMethod.POST)
    public String shoppingCartCustomerSave(HttpServletRequest request, //
            Model model, //
            @ModelAttribute("customerForm") @Validated CustomerInfo customerForm, //
            BindingResult result, //
            final RedirectAttributes redirectAttributes) {
    		
        // If has Errors.
        if (result.hasErrors()) {
            //customerForm.setValid(false);
            // Forward to reenter customer info.
            return "shoppingCartCustomer";
        }
 
        //customerForm.setValid(true);
        CartInfo cartInfo = Utils.getCartInSession(request);
 
        cartInfo.setCustomerInfo(customerForm);
 
        // Redirect to Confirmation page.
        return "redirect:/shoppingCartConfirmation";
    }
 
    // GET: Review Cart to confirm.
    @RequestMapping(value = { "/shoppingCartConfirmation" }, method = RequestMethod.GET)
    public String shoppingCartConfirmationReview(HttpServletRequest request, Model model) {
        CartInfo cartInfo = Utils.getCartInSession(request);
        ShippingCost shippingCost = null;
 
        // Cart have no products.
        if (cartInfo.isEmpty()) {
            // Redirect to shoppingCart page.
            return "redirect:/shoppingCart";
        } else {
        	Customer customer = customerDAO.lookUpCustomerWithID(Integer.parseInt(request.getUserPrincipal().getName()));
            // Enter customer info.
            //return "redirect:/shoppingCartCustomer";
        	CustomerInfo customerInfo = new CustomerInfo(customer);
        	cartInfo.setCustomerInfo(customerInfo);
        	
        	shippingCost = shippingCostsDAO.findByState(customer.getState());
        	Double total = cartInfo.getAmountTotal() + shippingCost.getCost();
        	
        	model.addAttribute("total", total);
        	model.addAttribute("shipping", shippingCost.getCost());
        	
        
        //model.addAttribute("cartInfo", cartInfo);
        return "shoppingCartConfirmation";
        }
    }
 
    // POST: Send Cart (Save).
    @RequestMapping(value = { "/shoppingCartConfirmation" }, method = RequestMethod.POST)
    // Avoid UnexpectedRollbackException (See more explanations)
    @Transactional(propagation = Propagation.NEVER)
    public String shoppingCartConfirmationSave(HttpServletRequest request, Model model) {
        CartInfo cartInfo = Utils.getCartInSession(request);
 
        // Cart have no products.
        if (cartInfo.isEmpty()) {
            // Redirect to shoppingCart page.
            return "redirect:/shoppingCart";
        } 
        
            orderDAO.saveOrder(cartInfo);
        /* catch (Exception e) {
            // Need: Propagation.NEVER?
        	System.out.println(e);
            return "shoppingCartConfirmation";
        }
        */
        // Remove Cart In Session.
        Utils.removeCartInSession(request);
         
        // Store Last ordered cart to Session.
        Utils.storeLastOrderedCartInSession(request, cartInfo);
 
        // Redirect to successful page.
        return "redirect:/shoppingCartFinalize";
    }
 
    @RequestMapping(value = { "/shoppingCartFinalize" }, method = RequestMethod.GET)
    public String shoppingCartFinalize(HttpServletRequest request, Model model) {
 
        CartInfo lastOrderedCart = Utils.getLastOrderedCartInSession(request);
 
        if (lastOrderedCart == null) {
            return "redirect:/shoppingCart";
        }
 
        return "shoppingCartFinalize";
    }
    
    @RequestMapping(value = { "/reports" }, method = RequestMethod.GET)
    public String reportsHandler(HttpServletRequest request, Model model) {
        
        
        //model.addAttribute("report", test); Will need if reports are immediately present
        return "reports";
    }
    
    @RequestMapping(value = { "/reportRendering" }, method = RequestMethod.GET)
    public String reportRenderingHandler(HttpServletRequest request, Model model) {
        
        List<Customer> customers = customerDAO.findAll();
        model.addAttribute("customers", customers); //Adds all customers to page
        return "reportRendering";
    }
 /*
    @RequestMapping(value = { "/productImage" }, method = RequestMethod.GET)
    public void productImage(HttpServletRequest request, HttpServletResponse response, Model model,
            @RequestParam("code") int code) throws IOException {
        Product product = null;
        product = this.productDAO.findProduct(code);
        
        if (product != null && product.getImage() != null) {
            response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
            response.getOutputStream().write(product.getImage());
        }
        response.getOutputStream().close();
    }
    */
     
}
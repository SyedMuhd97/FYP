package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.beans.Payment;
import com.beans.Product;
import com.beans.cart;
import com.beans.User;
import com.model.DB;

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<Product> list = new ArrayList<>();
	static ArrayList<String> cartlist = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	HttpSession session;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page == null || page.equals("index")) {
			
			DB db = new DB();
			 try {
				list = db.fetch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			 session = request.getSession();
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("list", list);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page.equals("login")) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		if(page.equals("sign-up")) {
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		
		if(page.equals("sign-up-form")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String address = request.getParameter("address");
			String password_1 = request.getParameter("password_1");
			String password_2 = request.getParameter("password_2");
			
			if(password_1.equals(password_2)) {
				
				User user = new User();
				user.setAddress(address);
				user.setEmail(email);
				user.setName(name);
				user.setUsername(username);
				user.setPassword(password_1);
				
				DB db = new DB();
				try {
					db.addUser(user);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				request.setAttribute("username", username);
				request.setAttribute("msg", "Account created successfully, Please Login!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				
			}else {
				request.setAttribute("msg", "The two passwords do not match");
				request.setAttribute("name", name);
				request.setAttribute("address", address);
				request.setAttribute("email", email);
				request.setAttribute("username", username);
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
			
		}
		
		if(page.equals("login-form")) {
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			DB db = new DB();
			User user = new User();
			boolean status = false;
			try {
				status = db.checkUser(username,password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(status) {
				session = request.getSession();
				session.setAttribute("session", session);
				
				try {
					userList = db.fetchUser();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				session.setAttribute("address", user.fetchadd(userList,username));
				session.setAttribute("email", user.fetchemail(userList,username));
				session.setAttribute("name", user.fetchname(userList,username));
				session.setAttribute("username", username);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "Invalid Crediantials");
				request.setAttribute("username", username);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		}
		
		if(page.equals("logout")) {
			session = request.getSession();
			session.invalidate();
			
			 session = request.getSession();
			 cartlist.clear();
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("list", list);
			
			request.getRequestDispatcher("indexRumah.jsp").forward(request, response);
		}
		
		if(page.equals("mobiles") || page.equals("laptops") || page.equals("clothing") || page.equals("home-decor") || page.equals("all-products")) {
			DB db = new DB();
			 try {
				list = db.fetch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("list", list);
			
			if(page.equals("mobiles"))
				request.getRequestDispatcher("mobiles.jsp").forward(request, response);
			if(page.equals("laptops"))
				request.getRequestDispatcher("laptops.jsp").forward(request, response);
			if(page.equals("clothing"))
				request.getRequestDispatcher("clothing.jsp").forward(request, response);
			if(page.equals("home-decor"))
				request.getRequestDispatcher("home-decor.jsp").forward(request, response);
			if(page.equals("all-products"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
		}
		
		
		
		if(page.equals("showcart")) {
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(page.equals("addtocart")) {
			String id = request.getParameter("id");
			String action = request.getParameter("action");
			Product p = new Product();
			boolean check = p.check(cartlist,id);
			cartlist.add(id);
			if(check)
				JOptionPane.showMessageDialog(null, "Product is already added to Cart", "Info", JOptionPane.INFORMATION_MESSAGE);
			
                        else {
			
			JOptionPane.showMessageDialog(null, "Product successfully added to Cart", "Info", JOptionPane.INFORMATION_MESSAGE);
			}
			
                        if(action.equals("indexRumah"))
				request.getRequestDispatcher("indexRumah.jsp").forward(request, response);
			if(action.equals("index"))
				request.getRequestDispatcher("index.jsp").forward(request, response);
			if(action.equals("allproducts"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
			if(action.equals("clothing"))
				request.getRequestDispatcher("clothing.jsp").forward(request, response);
			if(action.equals("home-decor"))
				request.getRequestDispatcher("home-decor.jsp").forward(request, response);
			if(action.equals("laptops"))
				request.getRequestDispatcher("laptops.jsp").forward(request, response);
			if(action.equals("mobiles"))
				request.getRequestDispatcher("mobiles.jsp").forward(request, response);
		}
		
		if(page.equals("success")) {
			
			request.getRequestDispatcher("success.jsp").forward(request, response);
			
			session = request.getSession();
			 cartlist.clear();
			 session.setAttribute("cartlist", cartlist);
		}
                
          
		
		if(page.equals("remove")) {
			String id = request.getParameter("id");
			Product p = new Product();
			cartlist = p.remove(cartlist,id);
			
			session = request.getSession();
			session.setAttribute("cartlist", cartlist);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(page.equals("price-sort")) {
			String price = request.getParameter("sort");
			String action = request.getParameter("action");
			Product p = new Product();
			if(price.equals("low-to-high"))
				list = p.lowtohigh(list);
			else
				list = p.hightolow(list);
			
			session.setAttribute("list", list);
			
			if(action.equals("index"))
				request.getRequestDispatcher("index.jsp").forward(request, response);
			if(action.equals("all-products"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
			if(action.equals("mobiles"))
				request.getRequestDispatcher("mobiles.jsp").forward(request, response);
			if(action.equals("laptops"))
				request.getRequestDispatcher("laptops.jsp").forward(request, response);
			if(action.equals("clothing"))
				request.getRequestDispatcher("clothing.jsp").forward(request, response);
			if(action.equals("home-decor"))
				request.getRequestDispatcher("home-decor.jsp").forward(request, response);
		}
                
                
            if(page.equals("editProfile")) {
                
			String username =(String)session.getAttribute("username");
			DB account = new DB();
			User u = null;
			try {
				 u = account.fecthUserByUsername(username);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("u", u);
			request.getRequestDispatcher("userProfileEdit2.jsp").forward(request, response);
		}
		
		if(page.equals("edit_profile")){
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String username = request.getParameter("username");
			String email = request.getParameter("category");
			String address = request.getParameter("featured");
			User u = new User();
			u.setId(Integer.parseInt(id));
			u.setName(name);
			u.setUsername(username);
			u.setEmail(email);
			u.setAddress(address);
			
			DB account = new DB();
			try {
				account.updateUserProfile(u);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JOptionPane.showMessageDialog(null, "Your details updated successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}    
                
                if(page.equals("userRegisterProduct")) {
			request.getRequestDispatcher("userRegisterProduct.jsp").forward(request, response);
		}
                
                	if(page.equals("userRegister_product")){
                        String userId = request.getParameter("userId");    
			String name = request.getParameter("name");
			String price = request.getParameter("price");
                        String qty = request.getParameter("qty");
			String category = request.getParameter("category");
			
			String image = request.getParameter("image");
			Product p = new Product();
                        p.setUserId(userId);
			p.setName(name);
			p.setPrice(price);
                        p.setQty(qty);
			p.setCategory(category);
			
			p.setImage("img/"+image);
			
			DB account = new DB();
			try {
				account.userRegisterProductToSell(p);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JOptionPane.showMessageDialog(null, "Product Successfully register, please wait for 4-5 for admin to approve your product", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("userRegisterProduct.jsp").forward(request, response);
		}
                        
                        //payment
                        
                         if(page.equals("payment")) {
			request.getRequestDispatcher("payment.jsp").forward(request, response);}
                
	
                
                	if(page.equals("make_payment")){
                        String userId = request.getParameter("userId");    
			String payDetail = request.getParameter("payDetail");
			String totalPrice = request.getParameter("totalPrice");
                    
			String receipt = request.getParameter("receipt");
			Payment py = new Payment();
                        py.setUserId(userId);
			py.setPayDetail(payDetail);
			py.setTotalPrice(totalPrice);
                
			py.setReceipt("img/"+receipt);
			
			DB account = new DB();
			try {
				account.userPayment(py);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JOptionPane.showMessageDialog(null, "Product Successfully paid, please wait for 4-5 for admin to approve your payment", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("success.jsp").forward(request, response);
		}
                
	}}

        

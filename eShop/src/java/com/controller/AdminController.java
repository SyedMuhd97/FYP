package com.controller;

import com.beans.Payment;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import com.beans.ProductRegister;
import com.beans.Product;
import com.model.DB;

public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page == null) {
			request.getRequestDispatcher("admin/login.jsp").forward(request, response);;
		}else {
			doPost(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page.equals("admin-login-form")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			
			if(username.equals("admin") && password.equals("1234")) {
				request.getRequestDispatcher("admin/index.jsp").forward(request, response);

			}
			else {
				request.setAttribute("msg", "Invalid Crediantials");
				request.setAttribute("username", username);
				request.getRequestDispatcher("admin/login.jsp").forward(request, response);

			}
		}
                
		 if(page.equals("report")) {
			request.getRequestDispatcher("admin/report.jsp").forward(request, response);
		}
                 
		if(page.equals("delete")) {
			String id = request.getParameter("id");
			DB db = new DB();
			try {
				db.deleteProduct(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			JOptionPane.showMessageDialog(null, "Product deleted successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);

		}
		
		if(page.equals("index")) {
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
		
		if(page.equals("addproduct")) {
			request.getRequestDispatcher("admin/addProduct.jsp").forward(request, response);
		}
		
		if(page.equals("edit")) {
			String id = request.getParameter("id");
			DB account = new DB();
			Product p = null;
			try {
				 p = account.fetchProduct(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("p", p);
			request.getRequestDispatcher("admin/editProduct.jsp").forward(request, response);
		}
		
		if(page.equals("edit_product")){
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String category = request.getParameter("category");
			String featured = request.getParameter("featured");
			Product p = new Product();
			p.setId(Integer.parseInt(id));
			p.setName(name);
			p.setPrice(price);
			p.setCategory(category);
			p.setFeatured(featured);
			
			DB account = new DB();
			try {
				account.updateProduct(p);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JOptionPane.showMessageDialog(null, "Product details updated successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
		
		if(page.equals("add_product")){
                    
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String category = request.getParameter("category");
			String qty = request.getParameter("qty");
			String image = request.getParameter("image");
			Product p = new Product();
			p.setName(name);
			p.setPrice(price);
			p.setCategory(category);
			p.setQty(qty);
			p.setImage("img/"+image);
			
			DB account = new DB();
			try {
				account.addProduct(p);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JOptionPane.showMessageDialog(null, "Product added Successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
                
                
                if(page.equals("adminManageUser")) {
			request.getRequestDispatcher("admin/adminManageUser.jsp").forward(request, response);
		}
                
                
                if(page.equals("deleteUser")) {
			String id = request.getParameter("id");
			DB db = new DB();
			try {
				db.deleteUser(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			JOptionPane.showMessageDialog(null, "Selected user has deleted successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/adminManageUser.jsp").forward(request, response);

		}
                
                //approve register p 
                
          
                 
          if(page.equals("approveproduct")) {
			request.getRequestDispatcher("admin/adminApproveProduct.jsp").forward(request, response);
		}      
             if(page.equals("toApproveproduct")) {
			String id = request.getParameter("id");
			DB account = new DB();
			 ProductRegister p  = null;
			try {
				 p = account.fetchRegisterProduct(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("p", p);
			request.getRequestDispatcher("admin/adminApproveProductForm2.jsp").forward(request, response);
		}
              

                
          if(page.equals("approve_Product")){
              
                        String id=request.getParameter("id");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String category = request.getParameter("category");
			String qty = request.getParameter("qty");
                       
			String image = request.getParameter("image");
			ProductRegister rp = new ProductRegister();
                        rp.setId(Integer.parseInt(id));
			rp.setName(name);
			rp.setPrice(price);
			rp.setCategory(category);
			rp.setQty(qty);
                       
			rp.setImage("img/"+image);
			
			DB account = new DB();
			try {
				account.addRegisterProduct(rp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JOptionPane.showMessageDialog(null, "User product added Successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/adminApproveProduct.jsp").forward(request, response);
		}
          
            if(page.equals("aRegisterProduct")) {
			String id = request.getParameter("id");
			DB db = new DB();
			try {
				db.aapproveRP(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			JOptionPane.showMessageDialog(null, "Product app successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/adminApproveProduct.jsp").forward(request, response);

		}
          
          
                	if(page.equals("toRemoveApproveproduct")) {
			String id = request.getParameter("id");
			DB db = new DB();
			try {
				db.deleteApproveProduct(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			JOptionPane.showMessageDialog(null, "Product remove successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/adminApproveProduct.jsp").forward(request, response);

		}
       //// approvepayment
       
         if(page.equals("approvepayment")) {
			request.getRequestDispatcher("admin/adminApprovePayment.jsp").forward(request, response);
		}
       
          	
                        
                        	if(page.equals("deletePayment")) {
			String id = request.getParameter("id");
			DB db = new DB();
			try {
				db.deleteApprovePayment(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			JOptionPane.showMessageDialog(null, "Product payment remove successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/adminApprovePayment.jsp").forward(request, response);

		}

          if(page.equals("aPayment")) {
			String id = request.getParameter("id");
			DB db = new DB();
			try {
				db.approvePayment(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			JOptionPane.showMessageDialog(null, "Product payment app successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/adminApprovePayment.jsp").forward(request, response);

		}
     
	}

}

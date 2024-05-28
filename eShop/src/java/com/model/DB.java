package com.model;

import com.beans.Payment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.beans.ProductRegister;
import com.beans.Product;
import com.beans.User;


public class DB {
	
	private String username = "root";
	private String password = "";
	private String dbName = "myproject";
	private String url = "jdbc:mysql://localhost:3306/" + dbName;
	private String driver = "com.mysql.jdbc.Driver";
	
	ArrayList<Product> list = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	
	private Connection con;
	private void dbConnect() {
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, username, password);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void dbClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void addUser(User user) throws SQLException {
		dbConnect();
		String sql = "Insert into user(name,email,username,address,password) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, user.getName());
		st.setString(2, user.getEmail());
		st.setString(3, user.getUsername());
		st.setString(4, user.getAddress());
		st.setString(5, user.getPassword());
		
		
		st.executeUpdate();
		dbClose();
	}

	public boolean checkUser(String username, String password) throws SQLException {
		dbConnect();
		int count = 0;
		String sql = "Select * from user where username = ? and password = ?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, username);
		st.setString(2, password);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			count = 1;
		}
		
		dbClose();
		if(count == 0)
			return false;
		
		return true;
	}

	public ArrayList<Product> fetch() throws SQLException {
		dbConnect();
		String sql = "Select * from product";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			int id=rs.getInt("id");
			String name= rs.getString("name");
			String category= rs.getString("category");
			String price= rs.getString("price");
			String featured= rs.getString("featured");
                        String qty= rs.getString("qty");
			String image= rs.getString("image");
			
			Product p = new Product();
			p.setCategory(category);
			p.setFeatured(featured);
			p.setId(id);
			p.setImage(image);
			p.setName(name);
			p.setPrice(price);
                        p.setQty(qty);
			list.add(p);
			p=null;
			
		}
		
		dbClose();
		return list;
	}

	public ArrayList<User> fetchUser() throws SQLException {
		dbConnect();
		String sql = "Select * from user";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			String address = rs.getString("address");
			String user = rs.getString("username");
			String email = rs.getString("email");
			String name = rs.getString("name");
			int id = rs.getInt("id");
			String password = rs.getString("password");
			
			User u = new User();
			u.setAddress(address);
			u.setEmail(email);
			u.setId(id);
			u.setName(name);
			u.setUsername(user);
			u.setPassword(password);
			userList.add(u);
			u=null;
				
		}
		
		dbClose();
		return userList;
	}
        
          public User fecthUserByUsername(String username) throws SQLException {
		
		dbConnect();
		String sql = "select name,email,address from user where username=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, username);
	ResultSet rst = st.executeQuery();
		User u = new User();
		while(rst.next()){
			
			u.setId(rst.getInt("id"));
			u.setName(rst.getString("name"));
			u.setUsername(rst.getString("username"));
			u.setEmail(rst.getString("email"));
			u.setAddress(rst.getString("address"));
			
		}
		dbClose();
		return u;
	}
          
          public void updateUserProfile(User u) throws SQLException {
		dbConnect();
		String sql = "update user set name=?,email=?,address=? where username=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, u.getName());
		st.setString(2, u.getEmail());
		st.setString(3, u.getAddress());
		st.setString(4, u.getUsername());
		
		st.executeUpdate();
		dbClose();
	}
        
        public void deleteUser(String id) throws SQLException {
		
		dbConnect();
		String sql = "Delete from user where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		dbClose();
		
	}

	public void deleteProduct(String id) throws SQLException {
		
		dbConnect();
		String sql = "Delete from product where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		dbClose();
		
	}

	public Product fetchProduct(String id) throws SQLException {
		dbConnect();
		String sql = "select * from product where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rst = pstmt.executeQuery();
		Product p = new Product();
		while(rst.next()){
			
			p.setId(rst.getInt("id"));
			p.setName(rst.getString("name"));
			p.setPrice(rst.getString("price"));
			p.setCategory(rst.getString("category"));
			p.setFeatured(rst.getString("featured"));
                        p.setFeatured(rst.getString("qty"));
			p.setImage(rst.getString("image"));
		}
		dbClose();
		return p;
	}
        
  

	public void updateProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "update product set name=?,price=?,category=?,featured=? where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, p.getName());
		st.setString(2, p.getPrice());
		st.setString(3, p.getCategory());
		st.setString(4, p.getFeatured());
		st.setInt(5, p.getId());
		st.executeUpdate();
		dbClose();
	}

	public void addProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "Insert into product(name,price,category,qty,image) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, p.getName());
		st.setString(2, p.getPrice());
		st.setString(3, p.getCategory());
		st.setString(4, p.getQty());
		st.setString(5, p.getImage());
		
		
		st.executeUpdate();
		dbClose();
	}
        
        public void userRegisterProductToSell(Product p) throws SQLException {
		dbConnect();
		String sql = "Insert into userregisterproduct(userId,name,price,qty,category,image) values(?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
                st.setString(1, p.getUserId());
		st.setString(2, p.getName());
		st.setString(3, p.getPrice());
                st.setString(4, p.getQty());
		st.setString(5, p.getCategory());
		st.setString(6, p.getImage());
		
		
		
		st.executeUpdate();
		dbClose();
	}
        
        	public void addOrder(Product p) throws SQLException {
		dbConnect();
		String sql = "Insert into order(name,price,category) values(?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, p.getName());
		st.setString(2, p.getPrice());
		st.setString(3, p.getCategory());
		
		
		
		st.executeUpdate();
		dbClose();
	}

	
                
            //aprrove prod    
                
                
       public ProductRegister fetchRegisterProduct (String id) throws SQLException {
		dbConnect();
		String sql = "select * from userregisterproduct where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rst = pstmt.executeQuery();
		ProductRegister p = new ProductRegister();
		while(rst.next()){
			
			p.setId(rst.getInt("id"));
			p.setName(rst.getString("name"));
			p.setPrice(rst.getString("price"));
			p.setCategory(rst.getString("category"));
			p.setFeatured(rst.getString("featured"));
                        p.setFeatured(rst.getString("qty"));
			p.setImage(rst.getString("image"));
		}
		dbClose();
		return p;
	}     
                
        public void addRegisterProduct(ProductRegister rp) throws SQLException {
		dbConnect();
		String sql = "Insert into product(name,price,category,qty,image) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, rp.getName());
		st.setString(2, rp.getPrice());
		st.setString(3, rp.getCategory());
		st.setString(4, rp.getQty());
		st.setString(5, rp.getImage());
		
		
		st.executeUpdate();
		dbClose();
	}    
            
                
      	public void deleteApproveProduct(String id) throws SQLException {
		
		dbConnect();
		String sql = "Delete from userregisterproduct where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		dbClose();
		
	}
	
        
     
  
       public void aapproveRP(String id) throws SQLException {
		
		dbConnect();
		String sql = "UPDATE userregisterproduct SET pRegisterStatus='approve' WHERE id=? ";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		dbClose();
		
	}
       
       
       //payment
             public void userPayment(Payment py) throws SQLException {
		dbConnect();
		String sql = "Insert into payment(userId,payDetail,totalPrice,receipt) values(?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
                st.setString(1, py.getUserId());
		st.setString(2, py.getPayDetail());
		st.setString(3, py.getTotalPrice());
          
		st.setString(4, py.getReceipt());
		
		
		
		st.executeUpdate();
		dbClose();
	}
             
              	public void deleteApprovePayment(String id) throws SQLException {
		
		dbConnect();
		String sql = "Delete from payment where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		dbClose();
		
	}
                
               public void approvePayment(String id) throws SQLException {
		
		dbConnect();
		String sql = "UPDATE payment SET paymentStatus='paid' WHERE id=? ";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		dbClose();
		
	}
          
}

<%-- 
    Document   : adminHeader
    Created on : May 9, 2019, 6:08:00 PM
    Author     : acer
--%>

<header>
		<h1>
			Welcome admin
		</h1>
		<nav>
			<ul>
				
                                <li><a href="admin?page=index">Home</a></li>
				<li><a href="admin?page=addproduct">Add Product</a></li>
                                <li><a href="admin?page=approveproduct">Approve Product</a></li>
                                 <li><a href="admin?page=approvepayment"> Approve Payment</a></li>
                                <li><a href="admin?page=adminManageUser">Manage User</a></li>
                                <li><a href="admin?page=report">Report</a></li>
				<li><a href="admin/login.jsp" onclick="return confirm('Are you sure to logout!')">Logout</a></li>
			</ul>
		</nav>
	</header>  
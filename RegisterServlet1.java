package practice;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.sql.Date;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;



@WebServlet("/RegisterServlet1")
public class RegisterServlet1 extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username,name, pwd, email,mobile,location,address;
		 int customerid;
		 LocalDate created_date;
		Connection conn = null;
		PreparedStatement ps = null;
		String qry, cs;
		PrintWriter pw = null;
		int nr;
		try {

			// read the inputs
			username = request.getParameter("username");
			pwd = request.getParameter("pwd");
			name = request.getParameter("name");
			mobile = request.getParameter("mobile");
			location = request.getParameter("location");
			address = request.getParameter("address");
		    created_date = LocalDate.parse(request.getParameter("created_date"));
			customerid = Integer.parseInt(request.getParameter("customerid"));
			

			
			pw = response.getWriter();

			
			Class.forName("org.postgresql.Driver");

			
			cs = "jdbc:postgresql://localhost/dhanush?user=postgres&password=dhanush2003";
			conn = DriverManager.getConnection(cs);

			
			qry = "insert into dhanush_customers(username,password,customerid,name,mobile,location,address,created_date) values(?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(qry);

			
			ps.setString(1, username);
			ps.setString(2, pwd);
			ps.setInt(3, customerid);
			ps.setString(4, name);
			ps.setString(5, mobile);
			ps.setString(5, location);
			ps.setString(5, address);
			ps.setDate(5, java.sql.Date.valueOf(created_date));


			nr = ps.executeUpdate();
			if (nr == 1)
				System.out.println("New Record has been inserted");
			else
				System.out.println("Failed to create new record");

			
			pw.write("<HTML>");
			pw.write("<h4>Congratulations " + username + "! Your account has been registerd sucessfully</h4>");

			conn.close();

		} catch (ClassNotFoundException cex) {
			System.out.println(cex.getMessage());
		} catch (SQLException sqex) {
			System.out.println(sqex.getMessage());
		} finally {
			response.getWriter().write("</HTML>");
		}

	}
}

package practice;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet1")
public class RegisterServlet1 extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username, fullname, pwd, email;
		long mobile;
		Connection conn = null;
		PreparedStatement ps = null;
		String qry, cs;
		PrintWriter pw = null;
		int nr;
		try {

			// read the inputs
			username = request.getParameter("username");
			pwd = request.getParameter("pwd");
			fullname = request.getParameter("fullname");
			email = request.getParameter("email");
			mobile = Long.parseLong(request.getParameter("mobile"));

			// get the Print Writer
			pw = response.getWriter();

			// register the driver
			Class.forName("org.postgresql.Driver");

			// connect to the database
			cs = "jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123";
			conn = DriverManager.getConnection(cs);

			// create prepared statement
			qry = "insert into dhanush_customers(username,fullname,pwd,email,mobile) values(?,?,?,?,?)";
			ps = conn.prepareStatement(qry);

			// pass the arguments
			ps.setString(1, username);
			ps.setString(2, pwd);
			ps.setString(3, pwd);
			ps.setString(4, email);
			ps.setLong(5, mobile);

			nr = ps.executeUpdate();
			if (nr == 1)
				System.out.println("New Record has been inserted");
			else
				System.out.println("Failed to create new record");

			// write some out to client
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

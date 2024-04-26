package practice;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet1")
public class LoginServlet1 extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String gpwd = request.getParameter("pwd");
		System.out.println("succ");
		PrintWriter out = response.getWriter();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(
					"jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123");

			String qry = "SELECT password FROM dhanush_customers WHERE username=?";
			ps = conn.prepareStatement(qry);
			ps.setString(1, username);
			rs = ps.executeQuery();

			out.println("<html>");

			if (rs.next()) {
				String apwd = rs.getString("password");
				System.out.println(apwd);
				if (gpwd.equals(apwd))
					out.println("<h4>Congratulations " + username + "! Your Login is successful</h4>");
				else
					out.println("<h4>Sorry " + username + "! Your Password is wrong</h4>");
			} else
				out.println("<h4>Sorry " + username + "! Your Username is wrong</h4>");

		} catch (ClassNotFoundException | SQLException e) {
			// Log the exception
			e.printStackTrace();
		} finally {
			// Close resources
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// Log the exception
				e.printStackTrace();
			}
			out.println("</html>");
			out.close();
		}
	}
}

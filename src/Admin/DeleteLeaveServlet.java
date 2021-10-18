package Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteLeaveServlet
 */
@WebServlet("/DeleteLeaveServlet")
public class DeleteLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int result=0;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteLeaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		//out.println("hello");
		
		response.setContentType("text/html");
		String Id = request.getParameter("id");
		int id=Integer.parseInt(Id);
		
		
		
		result=DataAccess.EmplayeeLeaveData.employeeLeaveDelete(id);
		
		 if(result>0)
         {
			 out.println("<script>alert('Delete successfully');window.location.href='http://localhost:8000/EmployeeManagement/Admin/ManageLeaveEmployee.jsp';</script>");
		  }
         else
         {
            // out.println("<script>alert('Error in delete.')</script>");
             out.println("<script>alert('Error in delete');window.location.href='http://localhost:8000/EmployeeManagement/Admin/ManageLeaveEmployee.jsp';</script>");
     		
         }
	}

}

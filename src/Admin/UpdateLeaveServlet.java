package Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmployeeLeaveModel;

/**
 * Servlet implementation class UpdateLeaveServlet
 */
@WebServlet("/UpdateLeaveServlet")
public class UpdateLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int result=0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLeaveServlet() {
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
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		String eid=request.getParameter("id");
		int lid=Integer.parseInt(eid);
		
	 	String email=request.getParameter("email");
	 	String description=request.getParameter("description");
	 	String fdate=request.getParameter("fdate");
	 	String tdate=request.getParameter("tdate");
	 	String status=request.getParameter("status");
	 	
	 	EmployeeLeaveModel emp =new EmployeeLeaveModel();
	 	
	 	emp.setId(lid);
	 	emp.setEmail(email);
	 	emp.setDescription(description);
	 	emp.setFdate(fdate);
	 	emp.setTdate(tdate);
	 	emp.setStatus(status);
	 	
	 	result=DataAccess.EmplayeeLeaveData.updateLeave(emp);
	 	
	 	if(result>0) {
	 		
	 		out.println("<script>alert('Update successfully');window.location.href='http://localhost:8000/EmployeeManagement/Admin/ManageLeaveEmployee.jsp';</script>");
	 	      
	 	}
	 	 else
	        {
	        	out.println("<script>alert('Error in Update ');window.location.href='http://localhost:8000/EmployeeManagement/Admin/UpdateEmployeeLeave.jsp';</script>");

	        }
	}

}

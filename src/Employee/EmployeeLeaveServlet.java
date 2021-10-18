package Employee;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmployeeLeaveModel;

/**
 * Servlet implementation class EmployeeLeaveServlet
 */
@WebServlet("/EmployeeLeaveServlet")
public class EmployeeLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeLeaveServlet() {
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
		
		String save=request.getParameter("Submit");
		
		if(save.equals("Apply")) {
	
	 	String email = request.getParameter("email");
        String description = request.getParameter("description");
        String fdate = request.getParameter("fdate");
        String tdate = request.getParameter("tdate");
        
        String status = request.getParameter("status");
       
        EmployeeLeaveModel e = new EmployeeLeaveModel();
        e.setEmail(email);
        e.setDescription(description);
        e.setFdate(fdate);
        e.setTdate(tdate);
        e.setStatus(status);
        
        
        
       
        int result = DataAccess.EmplayeeLeaveData.empLeaveInsert(e);
         
        if(result>0) {
        	
        	
        	out.println("<script>alert('Send Request successfully');window.location.href='http://localhost:8085/HospitalManagementSystem/Employee/ManageLeave.jsp';</script>");
        }
        else
        {
        	out.println("<script>alert('Error .');window.location.href='http://localhost:8085/HospitalManagementSystem/Admin/leave.jsp';</script>");

        }

		}  
	}

}

package Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmployeeModel;

/**
 * Servlet implementation class UpdateEmployeeServlet
 */
@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       int result=0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployeeServlet() {
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
		
		
		String EID=request.getParameter("id");
		int eid=Integer.parseInt(EID);
		
	 	String FName = request.getParameter("FName");
        String LName = request.getParameter("LName");
        String NIC = request.getParameter("NIC");
        String Mobile = request.getParameter("Mobile");
        int phone=Integer.parseInt(Mobile);
        String Address = request.getParameter("Address");
        String department = request.getParameter("department");   
        String jdate = request.getParameter("jdate"); 
        String bdate = request.getParameter("bdate"); 
        String gender = request.getParameter("gender");
        String email = request.getParameter("email"); 
	 
        EmployeeModel e = new EmployeeModel();
        e.setEID(eid);
        e.setFName(FName);
        e.setLName(LName);
        e.setNIC(NIC);
        e.setMobile(phone);
        e.setAddress(Address);
        e.setDepartment(department);
        e.setJdate(jdate);
        e.setBdate(bdate);
        e.setGender(gender);
        e.setEmail(email);
         result = DataAccess.empdata.employeeUpdate(e);
         
        if(result>0) {
        	out.println("<script>alert('Employee Update successfully');window.location.href='http://localhost:8000/HospitalManagementSystem/Admin/ManageEmployee.jsp';</script>");
        }
        else
        {
        	out.println("<script>alert('Error in Update Employee.');window.location.href='http://localhost:8000/HospitalManagementSystem/Admin/UpdateEmployee.jsp';</script>");

        }

		 
	}

}

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
 * Servlet implementation class AddEmployeeServlet
 */
@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployeeServlet() {
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
		
		if(save.equals("Add Employee")) {
	
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
        String username=request.getParameter("username");
        String password = request.getParameter("password");
        EmployeeModel e = new EmployeeModel();
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
        
        e.setUsername(username);
        e.setPassword(password);
        int result = DataAccess.empdata.employeeInsert(e);
         
        if(result>0) {
        	out.println("<script>alert('Employee added successfully');window.location.href='http://localhost:8085/HospitalManagementSystem/Admin/ManageEmployee.jsp';</script>");
        }
        else
        {
        	out.println("<script>alert('Error in adding Employee.');window.location.href='http://localhost:8085/HospitalManagementSystem/Admin/AddEmployee.jsp';</script>");

        }

		}  
            
	}

}

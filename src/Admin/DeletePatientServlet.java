package Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeletePatientServlet
 */
@WebServlet("/DeletePatientServlet")
public class DeletePatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePatientServlet() {
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
		String id = request.getParameter("id");
		
		
		
		int result=0;
		result=DataAccess.patientdata.PatientDelete(id);
		
		 if(result>0)
         {
			 out.println("<script>alert('delete successfully');window.location.href='http://localhost:8000/HospitalManagementSystem/Admin/ManagePatient.jsp';</script>");
		  }
         else
         {
           //  out.println("<script>alert('Error in delete Employee.')</script>");
             out.println("<script>alert('Error in delete ');window.location.href='http://localhost:8000/HospitalManagementSystem/Admin/ManagePatient.jsp';</script>");
         	
         }	
	}

}

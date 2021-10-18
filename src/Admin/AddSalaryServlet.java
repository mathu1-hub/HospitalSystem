package Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SalaryModel;

/**
 * Servlet implementation class AddSalaryServlet
 */
@WebServlet("/AddSalaryServlet")
public class AddSalaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSalaryServlet() {
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
		
		if(save.equals("Add Salary")) {
	
	 	String username = request.getParameter("username");
        String baslary = request.getParameter("bsalary");
       int bsal=Integer.parseInt(baslary);
       
       String othour = request.getParameter("othour");
       int OTH=Integer.parseInt(othour);
       	
       	String sdate=request.getParameter("sdate");
       	
        SalaryModel s = new SalaryModel();
        s.setUsername(username);
        
        s.setBsalary(bsal);
        
        s.setOthour(OTH);
        
        int otA=(OTH*200);
        s.setOtAmount(otA);
        
        int etf=(bsal*2/100);
        s.setEtf(etf);
        int epf=(bsal*2/100);
        
        s.setEpf(epf);
        
        int netamount=((bsal+otA)-(etf+epf));
        s.setNetamount(netamount);
        s.setSdate(sdate);
        int result = DataAccess.salarydata.salaryInsert(s);
         
        if(result>0) {
        	out.println("<script>alert('Salary added successfully');window.location.href='http://localhost:8085/HospitalManagementSystem/Admin/ManageSalary.jsp';</script>");
        }
        else
        {
        	out.println("<script>alert('Error in adding salary.');window.location.href='http://localhost:8085/HospitalManagementSystem/Admin/AddSalary.jsp';</script>");

        }

		}  
	}

}

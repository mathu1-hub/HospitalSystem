package DataAccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import DB.Dbconnect;
import model.patient;

public class patientdata {
	
	

//--------------------------------------------------------UPDATE QUERY------------------------------------------------------

	public static int salaryUpdate(patient s) {
		int result=0;
		 try {
			 	Connection connection=Dbconnect.getConnection();
			 	
	           
	            PreparedStatement ps =connection.prepareStatement("update  patient set pname=?,pdescription=?,date=?,empname=?,path=? where pid=?");
	           
	            ps.setString(1,s.getPname());
	            ps.setString(2,s.getPdescription());
	            
	            ps.setString(3,s.getDate());
	            ps.setString(4,s.getEmpname());
	            ps.setBlob(5, s.getPath());
	            ps.setString(6,s.getPid());
	            
	            
	            result = ps.executeUpdate();
	            ps.close();
	            connection.close();
	            
	           }catch (Exception ex) {

	              ex.printStackTrace();

	        }
		 return result;
	}
	

//--------------------------------------------------------GET ID QUERY------------------------------------------------------


public static patient getPatientById(String id){

	patient e = new patient();

try{
	Connection connection=Dbconnect.getConnection();
	 PreparedStatement ps =connection.prepareStatement("select * from patient where pid=?");
    ps.setString(1,id);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		
		e.setPid(rs.getString(1));
       
        
        e.setPname(rs.getString(2));
        e.setPdescription(rs.getString(3));
        
       e.setDate(rs.getString(4));
       e.setEmpname(rs.getString(5));
       e.setPath(rs.getBlob(6));
		
			
	}
	connection.close();
}catch(Exception ex){ex.printStackTrace();}

return e;
}

//--------------------------------------------------------DELETE QUERY------------------------------------------------------


public static int PatientDelete(String id){
	
	int status = 0;
	
	try{
		Connection connection=Dbconnect.getConnection();
		
		PreparedStatement ps =connection.prepareStatement("delete  from patient where pid=?");
		ps.setString(1,id);
		
		status = ps.executeUpdate();
		
		connection.close();
		
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	return status;
}
}

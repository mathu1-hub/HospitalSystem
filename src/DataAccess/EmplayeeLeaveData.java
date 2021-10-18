package DataAccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DB.Dbconnect;
import model.EmployeeLeaveModel;



public class EmplayeeLeaveData {
	//--------------------------------------------------------INSERT QUERY------------------------------------------------------
	
			public static int empLeaveInsert(EmployeeLeaveModel e) {
				
				int result=0;
				 try {
					 	Connection connection=Dbconnect.getConnection();
					 	
			            //String sql="insert into employee values(?,?,?,?,?,?,?,?,?,?)";
			            PreparedStatement ps =connection.prepareStatement("insert into employeeleave(email,	description,fdate,tdate,status) VALUES (?,?,?,?,?)");
			           
			            ps.setString(1,e.getEmail());
			            ps.setString(2,e.getDescription());
			            
			            ps.setString(3,e.getFdate());
			            ps.setString(4,e.getTdate());
			            ps.setString(5,e.getStatus());
			            
			            result = ps.executeUpdate();
			            ps.close();
			            connection.close();
			            
			           }catch (Exception ex) {

			              ex.printStackTrace();

			        }
				 return result;
			}
			//--------------------------------------------------------UPDATE QUERY------------------------------------------------------
			public static int updateLeave(EmployeeLeaveModel m) {
				int result=0;
				try {
					Connection conn=Dbconnect.getConnection();
					PreparedStatement s=conn.prepareStatement("update employeeleave set email=?,description=?,fdate=?,tdate=?,status=? where id=?");
					s.setString(1, m.getEmail());
					s.setString(2, m.getDescription());
					s.setString(3, m.getFdate());
					s.setString(4,m.getTdate());
					s.setString(5, m.getStatus());
					s.setInt(6, m.getId());
					
					result=s.executeUpdate();
					s.close();
				}catch(Exception ex) {
					ex.printStackTrace();
				}
				return result;
			}
			

			//--------------------------------------------------------DELETE QUERY------------------------------------------------------
			
			
			public static int employeeLeaveDelete(int id){
				
				int status = 0;
				
				try{
					Connection connection=Dbconnect.getConnection();
					
					PreparedStatement ps =connection.prepareStatement("delete  from employeeleave where id=?");
					ps.setInt(1,id);
					
					status = ps.executeUpdate();
					
					connection.close();
					
				}
				catch(Exception e){
					e.printStackTrace();
				}
				
				return status;
			}
			

			//--------------------------------------------------------DISPLAY QUERY------------------------------------------------------
			
			
					public static List<EmployeeLeaveModel> employeeLeaveDisplay() {
						
						List<EmployeeLeaveModel> list = new ArrayList<EmployeeLeaveModel>();
						try {
							Connection connection=Dbconnect.getConnection();
							PreparedStatement ps =connection.prepareStatement("select * from employeeleave ");
							ResultSet rs = ps.executeQuery();
							while(rs.next()) {
								EmployeeLeaveModel e = new EmployeeLeaveModel();
								e.setId(rs.getInt(1));
								e.setEmail(rs.getString(2));
								e.setDescription(rs.getString(3));
								e.setFdate(rs.getString(4));
								e.setTdate(rs.getString(5));
								e.setStatus(rs.getString(6));
								list.add(e);
							}
							connection.close();
						}catch(Exception ex) {ex.printStackTrace();}
						
						return list;
					}
					
			
			//--------------------------------------------------------GET ID QUERY------------------------------------------------------
			
			
			public static EmployeeLeaveModel getEmpLeaveById(int id){
				
				EmployeeLeaveModel ea = new EmployeeLeaveModel();
				
				try{
					Connection connection=Dbconnect.getConnection();
					 PreparedStatement ps =connection.prepareStatement("select * from employeeleave where id=?");
			        ps.setInt(1,id);
			       
					ResultSet rs=ps.executeQuery();
					if(rs.next()){
						
						ea.setId(rs.getInt(1));
						ea.setEmail(rs.getString(2));
						ea.setDescription(rs.getString(3));
						ea.setFdate(rs.getString(4));
						ea.setTdate(rs.getString(5));
						ea.setStatus(rs.getString(6));
						
							
					}
					connection.close();
				}catch(Exception ex){ex.printStackTrace();}
				
				return ea;
			}
			
		
	
}

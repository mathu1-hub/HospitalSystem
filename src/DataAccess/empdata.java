package DataAccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import DB.Dbconnect;
import model.EmployeeModel;

public class empdata {
	//--------------------------------------------------------INSERT QUERY------------------------------------------------------
	
		public static int employeeInsert(EmployeeModel e) {
			
			int result=0;
			 try {
				 	Connection connection=Dbconnect.getConnection();
				 	
		            //String sql="insert into employee values(?,?,?,?,?,?,?,?,?,?)";
		            PreparedStatement ps =connection.prepareStatement("insert into employee(FName,LName,NIC,Mobile,Address,department,jdate,bdate,gender,email,username,password) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
		           
		            ps.setString(1,e.getFName());
		            ps.setString(2,e.getLName());
		            
		            ps.setString(3,e.getNIC());
		            ps.setInt(4,e.getMobile());
		            ps.setString(5,e.getAddress());
		            ps.setString(6,e.getDepartment());
		            ps.setString(7,e.getJdate());
		            ps.setString(8,e.getBdate());
		            ps.setString(9,e.getGender());
		            ps.setString(10,e.getEmail());
		            ps.setString(11,e.getUsername());
		            ps.setString(12,e.getPassword());
		            result = ps.executeUpdate();
		            ps.close();
		            connection.close();
		            
		           }catch (Exception ex) {

		              ex.printStackTrace();

		        }
			 return result;
		}

		//--------------------------------------------------------UPDATE QUERY------------------------------------------------------
		
		public static int employeeUpdate(EmployeeModel e) {
			int result=0;
			 try {
				 	Connection connection=Dbconnect.getConnection();
				 	
		           
		            PreparedStatement ps =connection.prepareStatement("update employee set FName=?,LName=?,NIC=?,Mobile=?,Address=?,department=?,jdate=?,bdate=?,gender=?,email=? where EID=?");
		           
		            ps.setString(1,e.getFName());
		            ps.setString(2,e.getLName());
		            
		            ps.setString(3,e.getNIC());
		            ps.setInt(4,e.getMobile());
		            ps.setString(5,e.getAddress());
		            ps.setString(6,e.getDepartment());
		            ps.setString(7,e.getJdate());
		            ps.setString(8,e.getBdate());
		            ps.setString(9,e.getGender());
		            ps.setString(10,e.getEmail());
		            ps.setInt(11,e.getEID());
		            
		            result = ps.executeUpdate();
		            ps.close();
		            connection.close();
		            
		           }catch (Exception ex) {

		              ex.printStackTrace();

		        }
			 return result;
		}
		

		//--------------------------------------------------------DELETE QUERY------------------------------------------------------
		
		
		public static int employeeDelete(int id){
			
			int status = 0;
			
			try{
				Connection connection=Dbconnect.getConnection();
				
				PreparedStatement ps =connection.prepareStatement("delete  from employee where EID=?");
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
		
		
				public static List<EmployeeModel> employeeDisplay() {
					
					List<EmployeeModel> list = new ArrayList<EmployeeModel>();
					try {
						Connection connection=Dbconnect.getConnection();
						PreparedStatement ps =connection.prepareStatement("select * from employee ");
						ResultSet rs = ps.executeQuery();
						while(rs.next()) {
							EmployeeModel e = new EmployeeModel();
							e.setEID(rs.getInt(1));
					        e.setFName(rs.getString(2));
					        e.setLName(rs.getString(3));
					        e.setNIC(rs.getString(4));
					        e.setMobile(rs.getInt(5));
					        e.setAddress(rs.getString(6));
					        e.setDepartment(rs.getString(7));
					        e.setJdate(rs.getString(8));
					        e.setBdate(rs.getString(9));
					        e.setGender(rs.getString(10));
					        e.setEmail(rs.getString(11));
					        e.setUsername(rs.getString(12));
					        e.setPassword(rs.getString(13));
							list.add(e);
						}
						connection.close();
					}catch(Exception ex) {ex.printStackTrace();}
					
					return list;
				}
				
		
		//--------------------------------------------------------GET ID QUERY------------------------------------------------------
		
		
		public static EmployeeModel getEmployeeById(int id){
			
			EmployeeModel e = new EmployeeModel();
			
			try{
				Connection connection=Dbconnect.getConnection();
				 PreparedStatement ps =connection.prepareStatement("select * from employee where EID=?");
		        ps.setInt(1,id);
		       
				ResultSet rs=ps.executeQuery();
				if(rs.next()){
					
						e.setEID(rs.getInt(1));
				        e.setFName(rs.getString(2));
				        e.setLName(rs.getString(3));
				        e.setNIC(rs.getString(4));
				        e.setMobile(rs.getInt(5));
				        e.setAddress(rs.getString(6));
				        e.setDepartment(rs.getString(7));
				        e.setJdate(rs.getString(8));
				        e.setBdate(rs.getString(9));
				        e.setGender(rs.getString(10));
				        e.setEmail(rs.getString(11));
				        e.setUsername(rs.getString(12));
				        e.setPassword(rs.getString(13));
					
						
				}
				connection.close();
			}catch(Exception ex){ex.printStackTrace();}
			
			return e;
		}
}

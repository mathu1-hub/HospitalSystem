package DataAccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DB.Dbconnect;
import model.SalaryModel;

public class salarydata {
	//--------------------------------------------------------INSERT QUERY------------------------------------------------------
	
			public static int salaryInsert(SalaryModel s) {
				
				int result=0;
				 try {
					 	Connection connection=Dbconnect.getConnection();
					 	
			          
			            PreparedStatement ps =connection.prepareStatement("insert into salary(username,bsalary,othour,otAmount,etf,epf,netamount,sdate) VALUES (?,?,?,?,?,?,?,?)");
			           
			            ps.setString(1,s.getUsername());
			            ps.setInt(2,s.getBsalary());
			            ps.setInt(3, s.getOthour());
			            ps.setInt(4,s.getOtAmount());
			            ps.setInt(5,s.getEtf());
			            ps.setInt(6,s.getEpf());
			            ps.setInt(7,s.getNetamount());
			            ps.setString(8,s.getSdate());
			            result = ps.executeUpdate();
			            ps.close();
			            connection.close();
			            
			           }catch (Exception ex) {

			              ex.printStackTrace();

			        }
				 return result;
			}

		
		//--------------------------------------------------------UPDATE QUERY------------------------------------------------------
		
			public static int salaryUpdate(SalaryModel s) {
				int result=0;
				 try {
					 	Connection connection=Dbconnect.getConnection();
					 	
			           
			            PreparedStatement ps =connection.prepareStatement("update  salary set username=?,bsalary=?,othour=?,otAmount=?,etf=?,epf=?,netamount=?,sdate=? where sid=?");
			           
			            ps.setString(1,s.getUsername());
			            ps.setInt(2,s.getBsalary());
			            ps.setInt(3, s.getOthour());
			            ps.setInt(4,s.getOtAmount());
			            ps.setInt(5,s.getEtf());
			            ps.setInt(6,s.getEpf());
			            ps.setInt(7,s.getNetamount());
			            ps.setString(8, s.getSdate());
			            ps.setInt(9,s.getSid());
			            
			            result = ps.executeUpdate();
			            ps.close();
			            connection.close();
			            
			           }catch (Exception ex) {

			              ex.printStackTrace();

			        }
				 return result;
			}
			//--------------------------------------------------------DELETE QUERY------------------------------------------------------
			
			
			public static int SalaryDelete(int id){
				
				int status = 0;
				
				try{
					Connection connection=Dbconnect.getConnection();
					
					PreparedStatement ps =connection.prepareStatement("delete  from salary where sid=?");
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
			
			
			public static List<SalaryModel> salaryDisplay() {
				
				List<SalaryModel> list = new ArrayList<SalaryModel>();
				try {
					Connection connection=Dbconnect.getConnection();
					PreparedStatement ps =connection.prepareStatement("select * from salary ");
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						SalaryModel e = new SalaryModel();
						e.setSid(rs.getInt(1));
				        e.setUsername(rs.getString(2));
				        
				        e.setBsalary(rs.getInt(3));
				        e.setOthour(rs.getInt(4));
				        e.setOtAmount(rs.getInt(5));
				        e.setEtf(rs.getInt(6));
				        e.setEpf(rs.getInt(7));
				        e.setNetamount(rs.getInt(8));
				        e.setSdate(rs.getString(9));
						list.add(e);
					}
					connection.close();
				}catch(Exception ex) {ex.printStackTrace();}
				
				return list;
			}
			

	//--------------------------------------------------------GET ID QUERY------------------------------------------------------


	public static SalaryModel getSalaryById(int id){
		
		SalaryModel e = new SalaryModel();
		
		try{
			Connection connection=Dbconnect.getConnection();
			 PreparedStatement ps =connection.prepareStatement("select * from salary where sid=?");
	        ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				
				e.setSid(rs.getInt(1));
		        e.setUsername(rs.getString(2));
		        
		        e.setBsalary(rs.getInt(3));
		        e.setOthour(rs.getInt(4));
		        e.setOtAmount(rs.getInt(5));
		        e.setEtf(rs.getInt(6));
		        e.setEpf(rs.getInt(7));
		        e.setNetamount(rs.getInt(8));
				e.setSdate(rs.getString(9));
				
					
			}
			connection.close();
		}catch(Exception ex){ex.printStackTrace();}
		
		return e;
	}
}

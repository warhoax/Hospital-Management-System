
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author iwarh
 */
public class PatientIdIncrement {
    public int idincrement(){
        int id=1;
        PreparedStatement ps=null;
        ResultSet rs=null;
        Connect db=new Connect();
        try{
            ps=Connect.ConnectDB().prepareStatement("SELECT MAX(PatientID) FROM patientregistration");
            //ps=db.ConnectDB().preparedStatement("SELECT MAX(PatientID) FROM patientregistration");
            rs=ps.executeQuery();
            while(rs.next()){
                id=rs.getInt(1)+1;
            }
        }catch(Exception ex){
        System.out.println("Error"+ex.getMessage());}
        return id;
       
    
}
    //return id;
}

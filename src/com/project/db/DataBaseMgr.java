package com.project.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.project.db.DataBaseMgr;

public class DataBaseMgr {
	ResultSet rst;
	Connection con;
	Statement stmt;
	
	private DataBaseMgr(){
		
	}
	
	public static DataBaseMgr getDataBaseMgr(){
		return new DataBaseMgr();
	}
	
	public ResultSet getResultSet(String query) throws IOException, ClassNotFoundException, SQLException
	{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","rahul","rahul");
		
		stmt = con.createStatement();
		
		rst = stmt.executeQuery(query);
		
		return rst;
		
		
	}
	
	public Connection getConnection() throws ClassNotFoundException,SQLException
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","rahul","rahul");
		return con;
	}
	
	

}


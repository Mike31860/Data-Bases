package main;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.sql.*;

public class Main extends Application{

	@Override
	public void start(Stage primaryStage) throws Exception {
		
		Parent root = FXMLLoader.load(getClass().getResource("/view/GUI.fxml"));
		Scene scene = new Scene(root);
		
		primaryStage.setScene(scene);
		primaryStage.setTitle("Solicitudes");
		primaryStage.show();


	}
	
	public static void main (String[] args) {
		Connection conexion = null;
		String jdbcUni = "jdbc:oracle:thin:@172.16.0.103:1522/ESTUD";
		String jdbcCasa = "jdbc:oracle:thin:@200.3.193.24:1522/ESTUD";

		
		try {

			conexion = DriverManager.getConnection(jdbcUni, "P09551_1_18", "1007554028");
//			conexion = DriverManager.getConnection(jdbcCasa, "P09551_1_18", "1007554028");

			System.out.println("Conectado");
			launch(args);
			
		} catch(SQLException sql) {
			
			sql.printStackTrace();
		} finally {
			if(conexion != null) {
				
				try {
					conexion.close();
					System.out.println("Desconectado");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
				
			}
			
		}
		
		
		
	}
		
	
}
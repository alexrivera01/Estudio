package cliente;

import java.rmi.*;
import java.rmi.server.*;
import java.util.Properties;

public class ClienteBootStrap {

	public ClienteBootStrap() throws Exception{
		Properties p=System.getProperties();
		String url=p.getProperty("java.rmi.server.codebase");
		System.out.println("Cargando e instanciando el cliente");
		Class cliente=RMIClassLoader.loadClass(url,"cliente.CalcCliente");

		cliente.newInstance();
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		if (System.getSecurityManager()==null){
			System.setSecurityManager(new RMISecurityManager());
		}
		try{
			ClienteBootStrap cb= new ClienteBootStrap();
		}catch(Exception e){
		
			System.out.println("Cliente Listo");
		}
	}
}

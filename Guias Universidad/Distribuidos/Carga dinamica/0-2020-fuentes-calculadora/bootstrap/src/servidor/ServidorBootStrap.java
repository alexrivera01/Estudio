package servidor;

import java.rmi.*;
import java.rmi.server.*;
import java.util.Properties;
import java.rmi.Naming;

public class ServidorBootStrap {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//Crea e instala un security manager
		if (System.getSecurityManager()==null){
			System.setSecurityManager(new RMISecurityManager());
		}
		
		try{
			Properties p=System.getProperties();
			String url1=p.getProperty("java.rmi.server.codebase");
			System.out.println("Cargando e instanciando el objeto remoto servidor");
			Class serverclass=RMIClassLoader.loadClass(url1,"sop_rmi.CalculadoraImpl");
			System.out.println("Objeto Calculadora registrado en el N_S");
			//se utiliza la reflexion para crear una instancia
			//String url2="rmi://"+args[0]+":"+args[1]+"/ObjCalculadora";
			String url2="rmi://localhost:2030/ObjCalculadora";
			Naming.rebind(url2,(Remote)serverclass.newInstance());
			System.out.println("Servidor Listo");
		}catch(Exception e){
			System.out.println(e);
		}
	}
}

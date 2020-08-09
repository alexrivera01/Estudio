package servidor;

import java.rmi.Naming;

import sop_rmi.*;

public class CalcServidor{
	

	public static void main(String args[]) {

	try {
	    CalculadoraImpl obj = new CalculadoraImpl();
	    System.out.println("Objeto instanciado: "+obj);
	    // Operacion binding entre el objeto y el nombre "Calculadora"
	    //String url="rmi://"+args[0]+":"+args[1]+"/ObjCalculadora";
	    String url="rmi://localhost:2030/ObjCalculadora";
	    Naming.rebind(url, obj);
            
	    System.out.println("Objeto Calculadora registrado en el N_S");
	} catch (Exception e) {
	    System.out.println("CalcServidor error: " + e.getMessage());
	}
 }
}


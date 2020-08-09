package sop_rmi;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;


public class CalculadoraImpl extends UnicastRemoteObject implements CalculadoraIntR {

    public CalculadoraImpl() throws RemoteException {    
	System.out.println("CalculadoraImpl: creando al O.S.");
    }

    @Override
    public double suma(double a, double b) throws RemoteException {
        System.out.println("En el servidor: suma("+a+","+b+")");
        return a+b;
    }

    @Override
    public double resta(double a, double b) throws RemoteException {
         System.out.println("En el servidor: resta("+a+","+b+")");
      return a-b;
    }

    @Override
    public double multiplicacion(double a, double b) throws RemoteException {
         System.out.println("En el servidor: multiplicacion("+a+","+b+")");
        return a*b;
    }

    @Override
    public double division(double a, double b) throws RemoteException {
         System.out.println("En el servidor: division("+a+","+b+")");
        if (b!=0)        return a/b;
        else return Double.NaN;
    }


}

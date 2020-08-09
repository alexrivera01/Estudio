package sop_rmi;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface CalculadoraIntR extends Remote {
   double suma (double a, double b) throws RemoteException;
   double resta (double a, double b) throws RemoteException;
   double multiplicacion (double a, double b) throws RemoteException;
   double division (double a, double b) throws RemoteException;
}


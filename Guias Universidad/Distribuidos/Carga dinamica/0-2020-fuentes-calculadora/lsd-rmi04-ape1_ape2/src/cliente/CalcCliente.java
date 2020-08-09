package cliente;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.net.MalformedURLException;
import sop_rmi.CalculadoraIntR;


public class CalcCliente {
	
	private CalculadoraIntR objRefRemota;
	
	public CalcCliente()
	{
			try {
				System.out.println("Cliente: buscando al servicio Calculadora");
				String url="rmi://localhost:2030/ObjCalculadora";
				this.objRefRemota = (CalculadoraIntR) Naming.lookup(url);
			}    
			catch (NotBoundException e) {
			System.out.println("CalcCliente1 exception: " + e.getMessage());
			}
			catch (RemoteException e) {
			System.out.println("CalcCliente2 exception: " + e.getMessage());
			}
			catch (MalformedURLException e) {
			System.out.println("CalcCliente3 exception: " + e.getMessage());
			}
			
		}
		
	public void ejecutar() {
			
		try {

			
			double resultado = 0;
			int opcion = 0;
			BufferedReader br;
			String linea = "";
			double op1 = 0,op2 = 0;


			while (opcion!= 5){

				System.out.println("+---------  Calculadora Distribuida---------+");
				System.out.println("|                                           |");
				System.out.println("| Especifique el calculo que desea efecutar.|");
				System.out.println("| 1. Suma de dos numeros                    |");
				System.out.println("| 2. Resta de dos numeros                   |");
				System.out.println("| 3. Multiplicacion de dos numeros          |");
				System.out.println("| 4. Division de de dos numeros             |");
				System.out.println("| 5. Salir                                  |");
				System.out.println("+-------------------------------------------+");

				br = new BufferedReader(new InputStreamReader(System.in));
				linea = br.readLine();
				opcion = Integer.valueOf(linea);


				switch(opcion){

				 case 1:              
					System.out.println("Seleccionada la opcion SUMA.");
					System.out.println("Ingrese el primer operando: ");
					linea = br.readLine();
					op1 = Double.valueOf(linea);
					System.out.println("Ingrese el segundo operando: ");
					linea = br.readLine();
					op2 = Double.valueOf(linea);
					System.out.println("\nCliente: invocando suma("+op1+","+op2+")");
					resultado = objRefRemota.suma(op1, op2);
					System.out.println("\nEl resultado de la operacion es : "+resultado+"\n");
				break;
					 
					 
				case 2:
					System.out.println("Seleccionada la opcion RESTA.");
					System.out.println("Ingrese el primer operando: ");
					linea = br.readLine();
					op1 = Double.valueOf(linea);
					System.out.println("Ingrese el segundo operando: ");
					linea = br.readLine();
					op2 = Double.valueOf(linea);
					System.out.println("\nCliente: invocando resta("+op1+","+op2+")");
					resultado = objRefRemota.resta(op1, op2);
					System.out.println("\nEl resultado de la operacion es : "+resultado+"\n");
				break;
					
					
				case 3:
					System.out.println("Seleccionada la opcion MULTIPLICACION.");
					System.out.println("Ingrese el primer operando: ");
					linea = br.readLine();
					op1 = Double.valueOf(linea);
					System.out.println("Ingrese el segundo operando: ");
					linea = br.readLine();
					op2 = Double.valueOf(linea);
					System.out.println("\nCliente: invocando multiplicacion("+op1+","+op2+")");
					resultado = objRefRemota.multiplicacion(op1, op2);
					System.out.println("\nEl resultado de la operacion es : "+resultado+"\n");
				break;
					
					
				case 4:    
					System.out.println("Seleccionada la opcion DIVISION.");
					System.out.println("Ingrese el primer operando: ");
					linea = br.readLine();
					op1 = Double.valueOf(linea);
					System.out.println("Ingrese el segundo operando: ");
					linea = br.readLine();
					op2 = Double.valueOf(linea);
					System.out.println("\nCliente: invocando division("+op1+","+op2+")");
					resultado = objRefRemota.division(op1, op2);
					if (resultado == Double.NaN) {
					System.out.println("\nEl divisor es cero. La operacion no es posible.");
					}
					System.out.println("\nEl resultado de la operacion es : "+resultado+"\n");
				break;
					
					
				case 5:
					System.out.println("Terminando Ejecucion...");
				break;
					
					
				default:
						System.out.println("La opcion escogida no es valida");
				break;

				}
			}

		} 
		
		catch (RemoteException e) {
			System.out.println("CalcCliente exception: " + e.getMessage());
		} 
		catch (IOException e) {
			System.out.println("CalcCliente exception: " + e.getMessage());
		} 
    }
}

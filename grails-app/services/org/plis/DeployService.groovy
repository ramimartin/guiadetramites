package org.plis;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

public class DeployService {
	
	//Parametros
	private String pathDestino 		= "";//"/opt/mule/apps/";
	private String pathTemplate = "";//"/src/templates/ws-proxy-template";
	private String pathTemp 	= "/opt/plis/temp"; 
	private String pathFileProperties = pathTemp + "/classes/";
	private String pathFileProperties2 = pathTemp + "/META-INF/src/main/resources/";
	private String pathFileWSDL  = pathTemp + "/classes/wsdl/";
	private String pathFileWSDL2 = pathTemp + "/META-INF/src/main/resources/wsdl/";
	
	public boolean isDeployed(Servicio servicio, String deployPath ){
		
		String servicePath = deployPath + servicio.getNombre();
		
		System.out.println(servicePath);
		
		return new File(servicePath).exists();
		
	}
	
	public boolean deploy( 
			String nombreApp, 
			String adressInbound, 
			String adressOutbound, 
		/*	String namespaceOutbound, 
			String serviceOutbound,*/
			byte[] wsdlFile,
			String deployPath, /*"/opt/mule/apps/"*/
			String templatePath  /*"./src/templates/ws-proxy-template"*/
				) throws Exception 
	{
		
		//System.out.println(pathTemp);
		
		//Validamos los parametros
		if (deployPath == null || deployPath.isEmpty() ) 
			throw new Exception("El parametro deployPath es un parametro obligatorio");
		
		if (templatePath == null || templatePath.isEmpty()) 
			throw new Exception("El parametro templatePath es un parametro obligatorio");

		if (nombreApp == null || nombreApp.isEmpty()) 
			throw new Exception("El parametro nombreApp es un parametro obligatorio");

		if (adressInbound == null || adressInbound.isEmpty()) 
			throw new Exception("El parametro adressInbound es un parametro obligatorio");
		
		if (adressOutbound == null || adressOutbound.isEmpty()) 
			throw new Exception("El parametro adressOutbound es un parametro obligatorio");
		/*
		if (namespaceOutbound == null || namespaceOutbound.isEmpty()) 
			throw new Exception("El parametro namespaceOutbound es un parametro obligatorio");
		
		if (serviceOutbound == null || serviceOutbound.isEmpty()) 
			throw new Exception("El parametro serviceOutbound es un parametro obligatorio");
		*/
			
		if( wsdlFile.length == 0 )
			throw new Exception("El parametro wsdlFile debe contener datos.");
		
		
		//Verifico que exista el directorio del temporal 
		if( !new File(pathTemp).exists() )
		{
			//Si no existe lo creo
			if( !new File(pathTemp).mkdirs() )
				throw new Exception("El directorio temporal indicado no existe.");
		}	
		else
		{
			//Si existe, me aseguro que no tenga archivos. 
			limpiarDirectorio(new File(pathTemp));
		}
		
		//Cargos los valores que recibi como parametro en la clase
		this.pathDestino  = deployPath;
		
		//Verifico que exista el deploypath
		if( !new File(this.pathDestino).exists() )
		{
			if( !new File(this.pathDestino).mkdirs() )
				throw new Exception("El directorio de deploy seleccionado no existe.");
		}
				
				
		this.pathDestino += (nombreApp);
		
		//Me fijo que no exista una aplicacion con el mismo nombre que ya este deployada. 
		if( new File(pathTemplate).exists() )
		{
			throw new Exception("Ya existe una aplicacion desplegada con el mismo nombre.");
		}
		
		
		this.pathTemplate = templatePath;
		
		if( !new File(pathTemplate).exists() )
		{
			throw new Exception("El directorio de template indicado no existe.");
		}
		
		//Inicializamos las variables para manejar los directorios. 
		File srcFolder = new File(pathTemplate);
		File tempDestFolder = new File(pathTemp);
    	File destFolder = new File(pathDestino);
		
    	//Creo la copia temporal donde armo la nueva app.
    	try
    	{
    		
    		copyFolder(srcFolder,tempDestFolder);
        }
    	catch(IOException e)
    	{
    		throw new Exception("No se pudo copiar la carpeta de template al directorio temporal.");
        }		 
		
    	//Creo los archivos de configuracion    	
		PrintWriter writer;
		try 
		{
			
			/*
			 * <pattern:web-service-proxy name="countries" wsdlFile="wsdl/${http-endpoint-proxy-wsdlName}">
                <http:inbound-endpoint address="${http-endpoint-frontend}" exchange-pattern="request-response" />
                <http:outbound-endpoint address="${http-endpoint-destination-address}" exchange-pattern="request-response"/>

			 * */
			writer = new PrintWriter( this.pathFileProperties + "wsproxy.properties", "UTF-8");			
			writer.println("http-endpoint-destination-address=" + adressOutbound);	//http://www.webservicex.net/airport.asmx");
			//writer.println("http-endpoint-proxy-namespace=" + namespaceOutbound );	//http://www.webserviceX.NET");
			//writer.println("http-endpoint-proxy-service=" + serviceOutbound ); 		//airport");
			writer.println("http-endpoint-proxy-wsdlName=" + nombreApp + ".wsdl");//airport.wsdl");
			//writer.println("http-endpoint-proxy-frontend=" + adressInbound);//http://localhost:9003/aeropuertos");
			writer.println("http-endpoint-frontend=" + adressInbound);//http://localhost:9003/aeropuertos");
			writer.println("http-responseTimeout=600000");
			writer.close();
			
			writer = new PrintWriter( this.pathFileProperties2 + "wsproxy.properties", "UTF-8");
			writer.println("http-endpoint-destination-address=" + adressOutbound);	//http://www.webservicex.net/airport.asmx");
			//writer.println("http-endpoint-proxy-namespace=" + namespaceOutbound );	//http://www.webserviceX.NET");
			//writer.println("http-endpoint-proxy-service=" + serviceOutbound ); 		//airport");
			//writer.println("http-endpoint-proxy-wsdlName=" + nombreApp + ".wsdl");//airport.wsdl");
			writer.println("http-endpoint-proxy-wsdlName=" + nombreApp + ".wsdl");//airport.wsdl");
			writer.println("http-endpoint-frontend=" + adressInbound);//http://localhost:9003/aeropuertos");
			writer.println("http-responseTimeout=600000");
			writer.close();
			
			
		} 
		catch (Exception ex )
		{
			throw new Exception("No se pudo crear el archivo de configuracion en base a los parametros enviados.");
		}
		 
		//Creo los archivos wsdl    	
		try 
		{
			FileOutputStream fos = new FileOutputStream(this.pathFileWSDL + nombreApp + ".wsdl");
			fos.write(wsdlFile);
			fos.close();

			fos = new FileOutputStream(this.pathFileWSDL2 + nombreApp + ".wsdl");
			fos.write(wsdlFile);
			fos.close();

			
		} 		
		catch (Exception ex )
		{
			throw new Exception("No se pudo crear el archivo WSDL en base a los parametros enviados.");
		}

		//Muevo la carpeta al destino final
		return tempDestFolder.renameTo(destFolder);
	}
	
//	private void copyFile(File sourceFile, File destFile) throws IOException {
//	    if(!destFile.exists()) {
//	        destFile.createNewFile();
//	    }
//
//	    FileChannel source = null;
//	    FileChannel destination = null;
//	    try {
//	        source = new FileInputStream(sourceFile).getChannel();
//	        destination = new FileOutputStream(destFile).getChannel();
//
//	        // previous code: destination.transferFrom(source, 0, source.size());
//	        // to avoid infinite loops, should be:
//	        long count = 0;
//	        long size = source.size();              
//	        while((count += destination.transferFrom(source, count, size-count))<size);
//	    }
//	    finally {
//	        if(source != null) {
//	            source.close();
//	        }
//	        if(destination != null) {
//	            destination.close();
//	        }
//	    }
//	}

	private void limpiarDirectorio (File directorio){
		
		 File[] ficheros = directorio.listFiles();
		 
		 for (int x=0;x<ficheros.length;x++){

			 if (ficheros[x].isDirectory()) 
			 {
				 if( ficheros[x].listFiles().length > 0 )
					 limpiarDirectorio(ficheros[x]);
				 else
					 ficheros[x].delete();
				 
		     }
			 else
				 ficheros[x].delete();
		 }
		 directorio.delete();
	}

	private void copyFolder(File src, File dest) throws IOException
	{
	    	if(src.isDirectory())
	    	{
	    		//if directory not exists, create it
	    		if(!dest.exists()){
	    		   dest.mkdirs();
	    		   System.out.println("Directory copied from " 
	                              + src + "  to " + dest);
	    		}
				
	    		
	    		//GRAILS VERSION
				String sourceDir = pathTemplate
				String destinationDir = pathTemp
				new AntBuilder().copy(todir: destinationDir) {
					fileset(dir: sourceDir)
				}
				///////////////////////////////
				
			/*	
	    		//JAVA VERSION
	    		//list all the directory contents
	    		String files[] = src.list();
	 
	    		for (String file : files) {
	    		   //construct the src and dest file structure
	    		   File srcFile = new File(src, file);
	    		   File destFile = new File(dest, file);
	    		   //recursive copy
	    		   copyFolder(srcFile,destFile);
	    		}
	    		//////////////////////////////////
	    		*/
	    	}else{
	    		//if file, then copy it
	    		//Use bytes stream to support all file types
	    		InputStream inm = new FileInputStream(src);
	    	        OutputStream out = new FileOutputStream(dest); 
	 
	    	        byte[] buffer = new byte[1024];
	 
	    	        int length;
	    	        //copy the file content in bytes 
	    	        while ((length = inm.read(buffer)) > 0){
	    	    	   out.write(buffer, 0, length);
	    	        }
	 
	    	        inm.close();
	    	        out.close();
	    	        System.out.println("File copied from " + src + " to " + dest);
	    	}
	    }
}
/*
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
//import java.nio.channels.FileChannel;



public class DeployService {
	
	//Parametros
	String pathDestino = "/home/gaston/";
	String pathTemplate = "/home/gaston/ws-proxy-template";
	String pathTemp 	= "/home/gaston/temp/temporal";
	String pathFileProperties = pathTemp + "/classes/";
	String pathFileProperties2 = pathTemp + "/META-INF/src/main/resources/";
	String pathFileWSDL  = pathTemp + "/classes/wsdl/";
	String pathFileWSDL2 = pathTemp + "/META-INF/src/main/resources/wsdl/";
	
	
	public boolean deploy( 
			String nombreApp, 
			String adressInbound, 
			String adressOutbound, 
			String namespaceOutbound, 
			String serviceOutbound,
			byte[] wsdlFile )
	{
		
		//Cargos los valores que recibi como parametro en la clase
		this.pathDestino += nombreApp;
		
		//Inicializamos las variables para manejar los directorios. 
		File srcFolder = new File(pathTemplate);
		File tempDestFolder = new File(pathTemp);
    	File destFolder = new File(pathDestino);
		    	
    	if(!srcFolder.exists())
    	{
    		//System.out.println("El directorio de template configurado no existe.");
            return false;
        }
    	
    	//Creo la copia temporal donde armo la nueva app.
    	try
    	{
    		copyFolder(srcFolder,tempDestFolder);
        }
    	catch(IOException e)
    	{
    		//System.out.println("No se pudo crear el directorio de la nueva app a partir del template. Detalle: " + e.getMessage() );
             return false;
        }
		 
		//Creo los archivos de configuracion    	
		PrintWriter writer;
		try 
		{
			writer = new PrintWriter( this.pathFileProperties + "wsproxy.properties", "UTF-8");
			writer.println("http-endpoint-destination-address=" + adressOutbound);	//http://www.webservicex.net/airport.asmx");
			writer.println("http-endpoint-proxy-namespace=" + namespaceOutbound );	//http://www.webserviceX.NET");
			writer.println("http-endpoint-proxy-service=" + serviceOutbound ); 		//airport");
			writer.println("http-endpoint-proxy-wsdlName=" + nombreApp + ".wsdl");//airport.wsdl");
			writer.println("http-endpoint-frontend=" + adressInbound);//http://localhost:9003/aeropuertos");
			writer.println("http-responseTimeout=600000");
			writer.close();
			
			writer = new PrintWriter( this.pathFileProperties2 + "wsproxy.properties", "UTF-8");
			writer.println("http-endpoint-destination-address=" + adressOutbound);	//http://www.webservicex.net/airport.asmx");
			writer.println("http-endpoint-proxy-namespace=" + namespaceOutbound );	//http://www.webserviceX.NET");
			writer.println("http-endpoint-proxy-service=" + serviceOutbound ); 		//airport");
			writer.println("http-endpoint-proxy-wsdlName=" + nombreApp + ".wsdl");//airport.wsdl");
			writer.println("http-endpoint-frontend=" + adressInbound);//http://localhost:9003/aeropuertos");
			writer.println("http-responseTimeout=600000");
			writer.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		//Creo los archivos wsdl    	
		try 
		{
			FileOutputStream fos = new FileOutputStream(this.pathFileWSDL + nombreApp + ".wsdl");
			fos.write(wsdlFile);
			fos.close();
			
			fos = new FileOutputStream(this.pathFileWSDL2 + nombreApp + ".wsdl");
			fos.write(wsdlFile);
			fos.close();
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//Muevo la carpeta al destino final
		tempDestFolder.renameTo(destFolder);
			
		//Finalizo OK!
		return true;
	}
	
//	private void copyFile(File sourceFile, File destFile) throws IOException {
//	    if(!destFile.exists()) {
//	        destFile.createNewFile();
//	    }
//
//	    FileChannel source = null;
//	    FileChannel destination = null;
//	    try {
//	        source = new FileInputStream(sourceFile).getChannel();
//	        destination = new FileOutputStream(destFile).getChannel();
//
//	        // previous code: destination.transferFrom(source, 0, source.size());
//	        // to avoid infinite loops, should be:
//	        long count = 0;
//	        long size = source.size();              
//	        while((count += destination.transferFrom(source, count, size-count))<size);
//	    }
//	    finally {
//	        if(source != null) {
//	            source.close();
//	        }
//	        if(destination != null) {
//	            destination.close();
//	        }
//	    }
//	}
//	private void borrarDirectorio (File directorio){
//		
//		 File[] ficheros = directorio.listFiles();
//		 
//		 for (int x=0;x<ficheros.length;x++){
//
//			 if (ficheros[x].isDirectory()) 
//			 {
//				 borrarDirectorio(ficheros[x]);
//		     }
//			 else
//				 ficheros[x].delete();
//		 }
//		 
//		 directorio.delete();
//		
//	}
	private void copyFolder(File src, File dest)
	    	throws IOException{
	 
	    	if(src.isDirectory()){
	 
	    		//if directory not exists, create it
	    		if(!dest.exists()){
	    		   dest.mkdir();
	    		   System.out.println("Directory copied from " 
	                              + src + "  to " + dest);
	    		}
	 
	    		//list all the directory contents
	    		String files[] = src.list();
	 
	    		for (String file : files) {
	    		   //construct the src and dest file structure
	    		   File srcFile = new File(src, file);
	    		   File destFile = new File(dest, file);
	    		   //recursive copy
	    		   copyFolder(srcFile,destFile);
	    		}
	 
	    	}else{
	    		//if file, then copy it
	    		//Use bytes stream to support all file types
	    		InputStream in = new FileInputStream(src);
	    	        OutputStream out = new FileOutputStream(dest); 
	 
	    	        byte[] buffer = new byte[1024];
	 
	    	        int length;
	    	        //copy the file content in bytes 
	    	        while ((length = in.read(buffer)) > 0){
	    	    	   out.write(buffer, 0, length);
	    	        }
	 
	    	        in.close();
	    	        out.close();
	    	        System.out.println("File copied from " + src + " to " + dest);
	    	}
	    }
}
*/

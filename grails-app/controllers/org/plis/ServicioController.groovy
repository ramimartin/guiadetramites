package org.plis

import org.codehaus.groovy.runtime.memoize.Memoize.MemoizeNullValue;
import org.springframework.web.multipart.MultipartFile;

class ServicioController {
	
	def scaffold = Servicio

	def deploy () {
		
		String deployPath = "/opt/mule/apps/";
		String templatePath =  "/opt/plis/ws-proxy-template";
		
		DeployService deployer = new DeployService();
		Servicio servicio = Servicio.findById(params.id);		
		
		Boolean result = deployer.deploy(servicio.getNombre(), servicio.getAddressInbound(), 
										servicio.getAddressOutbound(),  
										servicio.getWsdlLocation(), deployPath, templatePath);
		
		if (result){
			flash.message = "Servicio <i>"+servicio.getNombre()+"</i> Desplegado"
			
		} else {
			flash.message = "Servicio NO SE PUdO DESPLEGAR el servicio: "+servicio.getNombre();
		}
		
		redirect(action: "list")
	}
	
	def isDeployed () {
		
		String deployPath = "/opt/mule/apps/";
		
		DeployService deployer = new DeployService();
		Servicio servicio = Servicio.findById(params.id);
		
		if (servicio.equals(null)){
			return false;
		}
		
		Boolean result = deployer.isDeployed(servicio, deployPath);
		//render(result);
		return result;
	}
	
}

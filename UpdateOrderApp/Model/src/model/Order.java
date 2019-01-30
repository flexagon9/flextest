package model;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

import javax.xml.ws.BindingType;
import javax.xml.ws.soap.SOAPBinding;

@WebService(portName = "updateOrder")
@BindingType(SOAPBinding.SOAP12HTTP_BINDING)
public class Order {
    public Order() {
        super();
    }

    @WebMethod
    public String updateOrder(@WebParam(name = "arg0") String orderNum){
        return "Order Updated";
    }
}

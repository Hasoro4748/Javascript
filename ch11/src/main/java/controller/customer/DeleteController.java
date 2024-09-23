package controller.customer;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CustomerService;


@WebServlet("/customer/delete.do")
public class DeleteController extends HttpServlet{

	//private Logger logger = LoggerFactory.getLogger("DeleteController");
	
	private static final long serialVersionUID = 7659210206973856332L;
	
	CustomerService service = CustomerService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String custId = req.getParameter("custId");
		
		service.deleteCustomer(custId);
		
		//logger.debug(custId);
		
		resp.sendRedirect("/ch11/customer/list.do");
		
	}
	
}

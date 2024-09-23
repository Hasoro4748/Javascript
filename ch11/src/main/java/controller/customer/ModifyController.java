package controller.customer;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CustomerDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CustomerService;

@WebServlet("/customer/modify.do")
public class ModifyController extends HttpServlet{

	private static final long serialVersionUID = -8486463622613147797L;

	CustomerService service = CustomerService.INSTANCE;

	private Logger logger = LoggerFactory.getLogger("ModifyController");
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String custId = req.getParameter("custId");

		CustomerDTO customer =  service.selectCustomer(custId);

		logger.debug(customer.toString());
		
		req.setAttribute("customer", customer);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/modify.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String custId = req.getParameter("custId");
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String addr = req.getParameter("addr");
		String rdate = req.getParameter("rdate");

		// DTO 생성(DTO - 데이터 전송 객체, 컴포넌트간 데이터 교환을 위한 객체)
		CustomerDTO dto = new CustomerDTO();
		dto.setCustId(custId);
		dto.setName(name);
		dto.setAddr(addr);
		dto.setHp(hp);
		dto.setRdate(rdate);

		logger.debug(dto.toString());
		
		// 데이터 수정 요청
		service.updateCustomer(dto);
		
		resp.sendRedirect("/ch11/customer/list.do");
	}

}

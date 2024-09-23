package controller.product;

import java.io.IOException;

import dto.ProductDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ProductService;

@WebServlet("/product/register.do")
public class RegisterController extends HttpServlet{
	private static final long serialVersionUID = -3407267622597968059L;
	
	ProductService service = ProductService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/product/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prodNo = req.getParameter("prodNo");
		String prodName = req.getParameter("prodName");
		String stock = req.getParameter("stock");
		String price = req.getParameter("price");
		String company = req.getParameter("company");
		
		ProductDTO dto = new ProductDTO();
		dto.setProdNo(prodNo);
		dto.setProdName(prodName);
		dto.setStock(stock);
		dto.setPrice(price);
		dto.setCompany(company);
		
		service.insertProduct(dto);
		
		resp.sendRedirect("/ch11/product/list.do");
	}
	
}

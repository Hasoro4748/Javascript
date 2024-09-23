package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import dto.ProductDTO;
import util.DBHelper;

public class ProductDAO extends DBHelper {
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	}
	private ProductDAO() {};
	
	public void insertProduct(ProductDTO dto) {
		String sql = "insert into customer values (?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getProdNo());
			psmt.setString(2, dto.getProdName());
			psmt.setString(3, dto.getStock());
			psmt.setString(4, dto.getPrice());
			psmt.setString(5, dto.getCompany());
			psmt.executeUpdate();
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ProductDTO selectProduct(String prodNo) {
		return null;
	}
	public List<ProductDTO> selectProducts(){
		
		List<ProductDTO> products = new ArrayList<>();
		
		String sql = "select * from `product`";
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProdNo(rs.getString(1));
				dto.setProdName(rs.getString(2));
				dto.setStock(rs.getString(3));
				dto.setPrice(rs.getString(4));
				dto.setCompany(rs.getString(5));
				products.add(dto);
			}
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	public void updateProduct(ProductDTO dto) {
		
	}
	public void deleteProduct(String prodNo) {
		try {
			String sql = "delete from `product` where `prodNo` = ?";
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, prodNo);
			
			psmt.executeUpdate();
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

package dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import dto.Product;

public class ProductRepository {

	private static ProductRepository instance = new ProductRepository();
	
	List<Product> listOfProduct = new Vector<Product>();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	/*
	 * public ProductRepository() {
	 * 
	 * //inputFile();
	 * 
	 * if(listOfProduct.size()==0) {
	 * 
	 * Product phone = new Product("P1234","iPhone 6s",800000); phone.
	 * setDescription("4.7-inch, 1334X750 Retina HD display, 8-megapixel iSight Camera"
	 * ); phone.setCategory("Smart Phone"); phone.setManufacturer("Apple");
	 * phone.setUnitPrice(800000); phone.setCondition("New");
	 * phone.setFilename("P1234.png");
	 * 
	 * Product notebook = new Product("P1235","LG PC 그램",1500000); notebook.
	 * setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core Process"
	 * ); notebook.setCategory("NoteBook"); notebook.setManufacturer("LG");
	 * notebook.setUnitPrice(1500000); notebook.setCondition("Refurbished");
	 * notebook.setFilename("P1235.png");
	 * 
	 * Product tablet = new Product("P1236","Galaxy tab S",900000); tablet.
	 * setDescription("212.8*125.6*6.6mm, Super AMOLED display, Octa-Core Process");
	 * tablet.setCategory("Tablet"); tablet.setManufacturer("Samsung");
	 * tablet.setUnitPrice(900000); tablet.setCondition("Old");
	 * tablet.setFilename("P1236.png");
	 * 
	 * listOfProduct.add(phone); listOfProduct.add(notebook);
	 * listOfProduct.add(tablet); } }
	 */

	public List<Product> getListOfProduct() {
		return listOfProduct;
	}
	
	public List<Product> getAllProducts() {
		return listOfProduct;
	}
	
	public Product getProductById(String id) {
		for(int i=0; i<listOfProduct.size(); i++) {
			Product product = listOfProduct.get(i);
			if(product.getProductId().equals(id)) {
				return product;
			}
		}
		return null;
	}
	
	//상품정보 추가
	public void addProduct(Product product) {
		
		listOfProduct.add(product);
		System.out.println(listOfProduct.get(listOfProduct.size()-1).getProductId());
		outputFile(listOfProduct);
	}
	//파일로 저장 메소드
	public void outputFile(List<Product> listOfProduct) {
		
		try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(new File("c:\\tmp\\productList.dat")))){
			
			oos.writeObject(listOfProduct);
			System.out.println("저장완료");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
	//저장 된 파일 출력 메소드
	public void inputFile() {
	
		try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream("c:\\tmp\\productList.dat"))){
			
			listOfProduct = (List<Product>)ois.readObject();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public String getProductSeq() { // 현재 상품코드 제일 마지막 번호의 다음 새로 갱신할 상품코드 번호를 자동으로 등록창에 입력되게 해주는 기능
		
		String seq = listOfProduct.get(listOfProduct.size()-1).getProductId().substring(1); //P1234
		int iSeq = Integer.parseInt(seq)+1;
		return "P"+iSeq;
		
	}
	
	public List<String> getCategories(){
		//카테고리 정보를 중복되지 않게 저장하기 위해 set에 저장
		Set<String> set = new HashSet<String>();
		for(Product p : listOfProduct) {
			set.add(p.getCategory());
		}
		System.out.println(set);
		// set에 저장 된 카테고리정보 list에 저장
		Iterator<String> itor = set.iterator();
		List<String> list = new ArrayList<String>();
		while(itor.hasNext()) {
			list.add(itor.next());
		}
		return list;
	}
}

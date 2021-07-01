package kr.smhrd.model;

public class BookVO {
	private int book_idx;
	private String ISBN;
	private String book_name;
	private String book_author;
	private String book_pub;
	private int book_age;
	private String book_rent;
	
	public int getBook_idx() {
		return book_idx;
	}
	public void setBook_idx(int book_idx) {
		this.book_idx = book_idx;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_pub() {
		return book_pub;
	}
	public void setBook_pub(String book_pub) {
		this.book_pub = book_pub;
	}
	public int getBook_age() {
		return book_age;
	}
	public void setBook_age(int book_age) {
		this.book_age = book_age;
	}
	public String getBook_rent() {
		return book_rent;
	}
	public void setBook_rent(String book_rent) {
		this.book_rent = book_rent;
	}
	
}

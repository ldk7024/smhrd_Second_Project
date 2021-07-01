package kr.smhrd.model;

public class BoardVO {
	private int board_idx;
	private String board_title;
	private String board_content;
	private String board_writer;
	private int board_count;
	private String board_indate;
	
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public String getBoard_indate() {
		return board_indate;
	}
	public void setBoard_indate(String board_indate) {
		this.board_indate = board_indate;
	}
	
	
	
}

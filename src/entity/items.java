package entity;

public class items {
	
	 private int id;
	 private String item_no;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getItem_no() {
		return item_no;
	}
	public void setItem_no(String item_no) {
		this.item_no = item_no;
	}
	@Override
	public String toString() {
		return "items [id=" + id + ", item_no=" + item_no + "]";
	}
	 

}

package reservation;

public class ReservationInforVO {
	private int idx;
	private String title;
	private String content;
	private int totalNum;
	private int reservationNum;
	private String progress;
	private String startDate;
	private String endDate;
	private String popup;
	private String photo;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getReservationNum() {
		return reservationNum;
	}
	public void setReservationNum(int reservationNum) {
		this.reservationNum = reservationNum;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getPopup() {
		return popup;
	}
	public void setPopup(String popup) {
		this.popup = popup;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "ReservationInforVO [idx=" + idx + ", title=" + title + ", content=" + content + ", totalNum=" + totalNum
				+ ", reservationNum=" + reservationNum + ", progress=" + progress + ", startDate=" + startDate + ", endDate="
				+ endDate + ", popup=" + popup + ", photo=" + photo + "]";
	}
}

package reservation;

public class ReservationVO {
	private int idx;
	private int resInforIdx;
	private int memberIdx;
	private String mid;
	private int reservationNum;
	private String reservationDate;
	private String rWDate;
	private String reservationFlag;
	
	private String title;
	private String startDate;
	private String endDate;
	private String content;
	private String photo;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getResInforIdx() {
		return resInforIdx;
	}
	public void setResInforIdx(int resInforIdx) {
		this.resInforIdx = resInforIdx;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getReservationNum() {
		return reservationNum;
	}
	public void setReservationNum(int reservationNum) {
		this.reservationNum = reservationNum;
	}
	public String getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
	public String getrWDate() {
		return rWDate;
	}
	public void setrWDate(String rWDate) {
		this.rWDate = rWDate;
	}
	public String getReservationFlag() {
		return reservationFlag;
	}
	public void setReservationFlag(String reservationFlag) {
		this.reservationFlag = reservationFlag;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "ReservationVO [idx=" + idx + ", resInforIdx=" + resInforIdx + ", memberIdx=" + memberIdx + ", mid=" + mid
				+ ", reservationNum=" + reservationNum + ", reservationDate=" + reservationDate + ", rWDate=" + rWDate
				+ ", reservationFlag=" + reservationFlag + ", title=" + title + ", startDate=" + startDate + ", endDate="
				+ endDate + ", content=" + content + ", photo=" + photo + "]";
	}
}
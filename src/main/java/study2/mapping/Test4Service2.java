package study2.mapping;

public class Test4Service2 {
	int su1, su2;
	
	public Test4Service2(int su1, int su2) {
		this.su1 = su1;
		this.su2 = su2;
	}
	
	public int test4Calc() {
		int res = su1 - su2;
		return res;
	}
}

package com.lunxuu.estore.pojo;

public class Cart {
	private int uid;
	private int gid;
	private int buynum;

	// 在购物记录中添加商品对象的引用：每条购物记录必然对应一个真实的商品
	private Good good; // “自对象”

	public Good getGood() {
		return good;
	}

	public void setGood(Good good) {
		this.good = good;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public int getBuynum() {
		return buynum;
	}

	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}

	@Override
	public String toString() {
		return "Cart [uid=" + uid + ", gid=" + gid + ", buynum=" + buynum + ", good=" + good + "]";
	}

}

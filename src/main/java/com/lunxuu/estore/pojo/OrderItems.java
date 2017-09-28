package com.lunxuu.estore.pojo;

public class OrderItems {
	private String oid;
	private int gid;
	private int buynum;
	// 一个订单明细对应一个商品
	private Good good;

	public Good getGood() {
		return good;
	}

	public void setGood(Good good) {
		this.good = good;
	}

	public OrderItems() {
		super();
	}

	public OrderItems(String oid, int gid, int buynum) {
		super();
		this.oid = oid;
		this.gid = gid;
		this.buynum = buynum;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
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
		return "OrderItems [oid=" + oid + ", gid=" + gid + ", buynum=" + buynum + ", good=" + good
				+ "]";
	}
}

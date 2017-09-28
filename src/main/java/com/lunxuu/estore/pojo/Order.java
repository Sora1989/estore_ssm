package com.lunxuu.estore.pojo;

import java.util.Date;
import java.util.List;

public class Order {
	private String id;
	private int uid;
	private double totalprice;
	private String address;
	private int status;
	private Date createtime;

	// 一个订单对应多个明细，因此在订单中添加订单明细对象的集合引用
	private List<OrderItems> list;

	public List<OrderItems> getList() {
		return list;
	}

	public void setList(List<OrderItems> list) {
		this.list = list;
	}

	public Order() {
		super();
	}

	// 提供有参构造之后，一定记得把无参构造补上！！
	public Order(String id, int uid, double totalprice, String address, int status, Date createtime) {
		super();
		this.id = id;
		this.uid = uid;
		this.totalprice = totalprice;
		this.address = address;
		this.status = status;
		this.createtime = createtime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", uid=" + uid + ", totalprice=" + totalprice + ", address="
				+ address + ", status=" + status + ", createtime=" + createtime + ", list=" + list
				+ "]";
	}

}

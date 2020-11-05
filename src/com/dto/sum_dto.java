package com.dto;

public class sum_dto {
	private int sum_amount;

	public int getSum_amount() {
		return sum_amount;
	}

	public void setSum_amount(int sum_amount) {
		this.sum_amount = sum_amount;
	}

	public sum_dto(int sum_amount) {
		super();
		this.sum_amount = sum_amount;
	}

	public sum_dto() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "sum_dto [sum_amount=" + sum_amount + "]";
	}
}

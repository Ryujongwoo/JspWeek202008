package com.koreait.vo;

import java.util.ArrayList;

public class CategoryList {

	private ArrayList<CategoryVO> categoryList = new ArrayList<CategoryVO>();

	public ArrayList<CategoryVO> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(ArrayList<CategoryVO> categoryList) {
		this.categoryList = categoryList;
	}
	
	@Override
	public String toString() {
		return "CategoryList [categoryList=" + categoryList + "]";
	}
	
}

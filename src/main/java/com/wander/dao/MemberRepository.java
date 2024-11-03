package com.wander.dao;

import java.util.ArrayList;

import com.wander.dto.Member;

public class MemberRepository {
	private ArrayList<Member> listOfMembers = new ArrayList<Member>();
	private static MemberRepository instance = new MemberRepository();
	
	public static MemberRepository getInstance() {
		return instance;
	}
	
	private MemberRepository() {
		Member admin = new Member("박창률", "admin@admin.com", "010-1234-5678", "parker", "admin12!");
		listOfMembers.add(admin);
	}
	
	public ArrayList<Member> getAllMembers() {
		return listOfMembers;
	}

	public Member getMemberByEmail(String memberEmail) {
		for (Member member : listOfMembers) {
			if (member != null && member.getEmail().equals(memberEmail)) {
				return member;
			}
		}
		return null;
	}
	
	public void addMember(Member member) {
		listOfMembers.add(member);
	}
	
	public boolean validateLogin(String email, String password) {
	    for (Member member : listOfMembers) {
	        if (member.getEmail().equals(email) && member.getPassword().equals(password)) {
	            return true;
	        }
	    }
	    return false;
	}
	
	public boolean registerMember(Member member) {
        if (getMemberByEmail(member.getEmail()) == null) {
            addMember(member);
            return true; // 등록 성공
        }
        return false; // 이미 존재하는 이메일
    }
}

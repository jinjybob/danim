package com.team2.danim.member;

public interface MemberMapper {

	public Member getMemberByID(Member m);

	int register(Member m);

	int deleteMember(Member m);

	int updateMember(Member m);

	int checkOverId(String dm_id);

	int checkOverNick(String dm_nickname);

	int checkOverMail(String dm_email);

	Member checkExistId(String dm_id);
	
	String findId(String dm_email);
	
	Member isValidInfo(Member m);

	int searchPw(Member m);


	

	
	
}

package com.acorn.baemin.user;

import java.util.List;

public interface UserRepositoryI {

	public List<UserDTO> selectAll() throws Exception;

	public boolean loginCustomer(String unputId, String inputPw) throws Exception;

	// �α���
	public String login();

	// Ȩ
	public String home();

	// ���� ����
	public String selectSignup();

	// ȸ������(��)
	public String customerSignup();

	// ��Ȩ(�α��� ��)
	public String customerHome();

	// �α׾ƿ�
	public String logout();

	// ����������(��)
	public String customerModify();

}

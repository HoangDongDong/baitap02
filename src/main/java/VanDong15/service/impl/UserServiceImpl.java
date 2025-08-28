package VanDong15.service.impl;

import VanDong15.dao.UserDao;
import VanDong15.dao.Impl.UserDaoImpl;
import models.User;
import VanDong15.service.UserService;

public class UserServiceImpl implements UserService {
	UserDao userDao = new UserDaoImpl();

	@Override
	public User login(String username, String password) {
		User user = this.get(username);
		if (user != null && password.equals(user.getPassWord())) {
			return user;
		}
		return null;
	}
	@Override
	public User get(String username) {
	return userDao.get(username);
	}
}

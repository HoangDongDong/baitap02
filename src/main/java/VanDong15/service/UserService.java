package VanDong15.service;

import models.User;

public interface UserService {
	User login(String username, String password);
	User get(String username);
}

package VanDong15.controller;

import java.io.IOException;
import java.security.SecureRandom;

import VanDong15.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;

@WebServlet(urlPatterns = "/forgot")
public class ForgotPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final SecureRandom rand = new SecureRandom();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/forgot.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String username = req.getParameter("username");
		String email = req.getParameter("email");

		if (username == null || email == null || username.isBlank() || email.isBlank()) {
			req.setAttribute("alert", "Vui lòng nhập đầy đủ username và email.");
			req.getRequestDispatcher("/views/forgot.jsp").forward(req, resp);
			return;
		}

		UserServiceImpl service = new UserServiceImpl();
		User u = service.get(username); // đã có sẵn trong service/dao
		if (u == null || !email.equalsIgnoreCase(u.getEmail())) {
			req.setAttribute("alert", "Thông tin không khớp. Vui lòng kiểm tra lại.");
			req.getRequestDispatcher("/views/forgot.jsp").forward(req, resp);
			return;
		}

		// Tạo OTP 6 chữ số
		int code = 100000 + rand.nextInt(900000);

		HttpSession session = req.getSession(true);
		session.setAttribute("fp_username", username);
		session.setAttribute("fp_code", String.valueOf(code));
		session.setAttribute("fp_exp", System.currentTimeMillis() + 5 * 60_000); // hết hạn 5 phút

		// Demo: hiển thị OTP ngay trên trang reset (thực tế sẽ gửi email)
		req.setAttribute("info", "Mã OTP đã được tạo (demo): " + code + ". OTP hết hạn trong 5 phút.");
		req.getRequestDispatcher("/views/reset.jsp").forward(req, resp);
	}
}

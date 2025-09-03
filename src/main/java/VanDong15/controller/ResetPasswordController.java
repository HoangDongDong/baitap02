package VanDong15.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import VanDong15.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/reset")
public class ResetPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Chỉ cho vào nếu đã có phiên forgot
        HttpSession s = req.getSession(false);
        if (s == null || s.getAttribute("fp_username") == null) {
            resp.sendRedirect(req.getContextPath() + "/forgot");
            return;
        }
        req.getRequestDispatcher("/views/reset.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        HttpSession s = req.getSession(false);
        if (s == null) { resp.sendRedirect(req.getContextPath()+"/forgot"); return; }

        String username = (String) s.getAttribute("fp_username");
        String expect   = (String) s.getAttribute("fp_code");
        Long   expAt    = (Long)   s.getAttribute("fp_exp");

        String otp      = req.getParameter("otp");
        String pass     = req.getParameter("password");
        String confirm  = req.getParameter("confirm");

        if (username == null || expect == null || expAt == null) {
            resp.sendRedirect(req.getContextPath()+"/forgot"); return;
        }
        if (System.currentTimeMillis() > expAt) {
            s.removeAttribute("fp_username");
            s.removeAttribute("fp_code");
            s.removeAttribute("fp_exp");
            req.setAttribute("alert", "OTP đã hết hạn. Vui lòng lấy lại mã mới.");
            req.getRequestDispatcher("/views/forgot.jsp").forward(req, resp);
            return;
        }
        if (otp == null || !otp.equals(expect)) {
            req.setAttribute("alert", "OTP không đúng.");
            req.getRequestDispatcher("/views/reset.jsp").forward(req, resp);
            return;
        }
        if (pass == null || confirm == null || pass.isBlank() || !pass.equals(confirm)) {
            req.setAttribute("alert", "Mật khẩu mới không hợp lệ hoặc không trùng khớp.");
            req.getRequestDispatcher("/views/reset.jsp").forward(req, resp);
            return;
        }

        UserServiceImpl service = new UserServiceImpl();
        boolean ok = service.updatePassword(username, pass);

        // dọn session OTP
        s.removeAttribute("fp_username");
        s.removeAttribute("fp_code");
        s.removeAttribute("fp_exp");

        if (ok) {
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.setAttribute("alert", "Không cập nhật được mật khẩu. Thử lại sau.");
            req.getRequestDispatcher("/views/reset.jsp").forward(req, resp);
        }
    }
}

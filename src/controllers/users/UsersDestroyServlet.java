package controllers.users;

import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class UsersDestroyServlet
 */
@WebServlet("/users/destroy")
public class UsersDestroyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersDestroyServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String _token = request.getParameter("_token");
	        if(_token != null && _token.equals(request.getSession().getId())) {
	            EntityManager em = DBUtil.createEntityManager();

	            User u = em.find(User.class, (Integer)(request.getSession().getAttribute("user_id")));
	            u.setDelete_flag(1);
	            u.setUpdated_at(new Timestamp(System.currentTimeMillis()));

	            em.getTransaction().begin();
	            em.getTransaction().commit();
	            em.close();
	            request.getSession().setAttribute("flush", "削除が完了しました。");

	            response.sendRedirect(request.getContextPath() + "/");
	        }
	}

}

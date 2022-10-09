package academy.prog;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

// Req -> (S -> S) -> jsp
@WebServlet("/info")
public class InfoServlet extends HttpServlet {

    static Map<String,Integer> questionAnswears = new HashMap<>();

    protected static void createStatistic(String answear){
        if(!questionAnswears.containsKey(answear)){
            questionAnswears.put(answear,1);
        } else {
            questionAnswears.put(answear,questionAnswears.get(answear)+1);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String answer1 = request.getParameter("answear1");
        String answer2 = request.getParameter("answear2");

        InfoServlet.createStatistic(answer1);
        InfoServlet.createStatistic(answer2);

        if (name.length()>0) {
            HttpSession session = request.getSession(true);
            session.setAttribute("user_name", name);
            session.setAttribute("answear", questionAnswears);
        }
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String a = request.getParameter("b");
        HttpSession session = request.getSession(false);

        if ("exit".equals(a) && (session != null))
            session.removeAttribute("user_name");
            session.removeAttribute("answear");
        response.sendRedirect("index.jsp");
    }
}

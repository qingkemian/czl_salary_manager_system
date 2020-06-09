package servlet;

import services.StaffServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @描述：
 * @创建人:ZelongChen
 * @日期:08/06/2020 21:28
 */

@WebServlet(name = "DeleteStaffServlet",urlPatterns = "/deleteStaff")
public class DeleteStaffServlet extends HttpServlet {
    private StaffServer staffServer=new StaffServer();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int staffID=Integer.parseInt(request.getParameter("staffID").toString());
        boolean result=staffServer.deleteStaff(staffID);
        response.sendRedirect("/showAllStaffList");
    }
}

package servlet;

import model.Staff;
import services.SalaryServer;
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
 * @日期:08/06/2020 21:27
 */

@WebServlet(name = "CalaStaffSalaryServlet",urlPatterns = "/calaStaffSalary")
public class CalaStaffSalaryServlet extends HttpServlet {
    private StaffServer staffServer=new StaffServer();
    private SalaryServer salaryServer=new SalaryServer();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int staffID=Integer.parseInt(request.getParameter("staffID").toString());
        Staff staff= staffServer.queryStaffByStaffID(staffID);
        if(staff!=null)
        {
            boolean result= salaryServer.calaStaffSalary(staff);
            if(result)
            {
                response.sendRedirect("/showStaffSalaryTable?staffID="+staff.getStaffID());
            }
            else
            {
                response.sendRedirect("/showStaffSalaryTable?staffID="+staff.getStaffID());
            }
        }
        else
        {
            response.sendRedirect("/showStaffSalaryTable?staffID="+staff.getStaffID());
        }
    }
}
package servlet;

import model.Dept;
import model.Staff;
import services.DeptServer;
import services.StaffServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @描述：
 * @创建人:ZelongChen
 * @日期:08/06/2020 22:01
 */

@WebServlet(name = "ShowStaffListServlet",urlPatterns = "/showAllStaffList")
public class ShowStaffListServlet extends HttpServlet {
    private StaffServer staffServer=new StaffServer();
    private DeptServer deptServer=new DeptServer();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Dept> deptList=deptServer.getAllDept();
        if(deptList!=null)
        {
            List<Staff> staffList= staffServer.getAllStaff();
            if(staffList!=null)
            {
                for(int i=0;i<deptList.size();i++)
                {
                    for (int j=0;j<staffList.size();j++)
                    {
                        if(staffList.get(j).getDeptID()==deptList.get(i).getDeptID())
                            staffList.get(j).setDeptName(deptList.get(i).getDeptName());
                    }
                }
                request.setAttribute("staffList",staffList);
            }
            else
            {
                request.setAttribute("error","没有查询到员工信息");
            }
        }
        else
        {
            request.setAttribute("error","没有查询到部门信息");
        }
        request.getRequestDispatcher("/staffinfoManager.jsp").forward(request,response);
    }
}

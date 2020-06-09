package model;

/**
 * @描述：
 * @创建人:ZelongChen
 * @日期:08/06/2020 21:24
 */

public class Dept {
    private int deptID;

    public int getDeptID() {
        return deptID;
    }

    public void setDeptID(int deptID) {
        this.deptID = deptID;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    private String deptName;
}

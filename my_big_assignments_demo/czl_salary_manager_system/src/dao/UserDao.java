package dao;

import model.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.DBUtils;

import java.sql.SQLException;

/**
 * @描述：
 * @创建人:ZelongChen
 * @日期:08/06/2020 21:24
 */

public class UserDao {
    public boolean IdentifyAdministrator(User user) throws SQLException {
        QueryRunner runner= new QueryRunner(DBUtils.getDataSource());
        String sql="select * from administrator where username=? and password=?";
        User temp=runner.query(sql, new BeanHandler<User>(User.class),user.getUsername(),user.getPassword());
        if(temp!=null)
            return true;
        else
            return false;
    }
}

package com.example.quanlyuser.model;

import jdk.internal.foreign.CABI;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO{
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo";
    private String jdbcUserName = "root";
    private String jdbcPassWord="123456";
    private static final String INSERT_USERS_SQL = "INSERT INTO users(name,email,country) values (?,?,?);";
    private static final String SELECT_USERS_BY_ID = "select id ,name,email,country from users where id=?;";
    private static final String SELECT_ALL_USERS = "select * from users;";
    private static final String DELETE_USERS_SQL ="delete from users where id=?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email=?,country=? where id=?;";
    private static final String SQL_INSERT = "INSERT INTO EMPLOYEE (NAME, SALARY, CREATED_DATE) VALUES (?,?,?)";
    private static final String SQL_UPDATE = "UPDATE EMPLOYEE SET SALARY=? WHERE NAME=?";
    private static final String SQL_TABLE_CREATE = "CREATE TABLE EMPLOYEE"
            + "("
            + " ID serial,"
            + " NAME varchar(100) NOT NULL,"
            + " SALARY numeric(15, 2) NOT NULL,"
            + " CREATED_DATE timestamp,"
            + " PRIMARY KEY (ID)"
            + ")";
    private static final String SQL_TABLE_DROP = "DROP TABLE IF EXISTS EMPLOYEE";
    public UserDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassWord);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL))
        {
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try(Connection connection = getConnection();PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_BY_ID))
        {
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                user = new User(id,name,email,address);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try(Connection connection = getConnection();PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS))
        {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id,name,email,country));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try(Connection connection = getConnection();PreparedStatement preparedStatement= connection.prepareStatement(DELETE_USERS_SQL))
        {
            preparedStatement.setInt(1,id);
            rowDeleted=preparedStatement.executeUpdate()>0;
        }

        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try(Connection connection = getConnection();PreparedStatement preparedStatement= connection.prepareStatement(UPDATE_USERS_SQL))
        {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            preparedStatement.setInt(4,user.getId());
            rowUpdated = preparedStatement.executeUpdate()>0;
        }
        return rowUpdated;
    }

    @Override
    public User getUserById(int id) {
      User user= null;
      String query = "{Call get_user_by_id(?)}";
        try(Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(query))
        {
            callableStatement.setInt(1,id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        }catch (SQLException e)
        {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        String query = "{Call insert_user(?,?,?)}";
        try(Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(query))
        {
            callableStatement.setString(1,user.getName());
            callableStatement.setString(2,user.getEmail());
            callableStatement.setString(3,user.getCountry());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        }catch (SQLException e){
           printSQLException(e);
        }
    }

    @Override
    public void addUserTransaction(User user, List<Integer> permissions) {
     Connection connection = null;
     PreparedStatement pstmt = null;
     PreparedStatement pstmtAssignment=null;
        ResultSet rs = null;
     try {
         connection = getConnection();
         connection.setAutoCommit(false);
         pstmt = connection.prepareStatement(INSERT_USERS_SQL,Statement.RETURN_GENERATED_KEYS);
         pstmt.setString(1,user.getName());
         pstmt.setString(2,user.getEmail());
         pstmt.setString(3,user.getCountry());
         rs = pstmt.getGeneratedKeys();
         int rowAffected = pstmt.executeUpdate();
         int userId=0;
         if(rs.next())
             userId=rs.getInt(1);
         if(rowAffected==1){
             String sqlPivot = "INSERT INTO user_permission(user_id,permission_id)";
             pstmtAssignment = connection.prepareStatement(sqlPivot);
             for (int permissonId : permissions){
                 pstmtAssignment.setInt(1,userId);
                 pstmtAssignment.setInt(2,permissonId);
                 pstmtAssignment.executeUpdate();
             }
             connection.commit();
         }else
            connection.rollback();
     }catch (SQLException ex){
         try {
             if(connection!=null){
                 connection.rollback();
             }
         }catch (SQLException e){
             System.out.println(e.getMessage());
         }
         System.out.println(ex.getMessage());
     }
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        try(Connection connection = getConnection() ;
            Statement statement = connection.createStatement();
        PreparedStatement psInsert = connection.prepareStatement(SQL_INSERT);
        PreparedStatement psUpdate = connection.prepareStatement(SQL_UPDATE))
        {  statement.execute(SQL_TABLE_DROP);
            statement.execute(SQL_TABLE_CREATE);
            psInsert.setString(1,"Hiếu");
            psInsert.setBigDecimal(2,new BigDecimal(10));
            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();
            psUpdate.setBigDecimal(2,new BigDecimal(999));
            psUpdate.setString(2,"Bé Thảo");
            psUpdate.execute();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void insertUpdateUseTransaction() {
        try(Connection conn = getConnection();
        Statement statement = conn.createStatement();
        PreparedStatement psInsert = conn.prepareStatement(INSERT_USERS_SQL);
        PreparedStatement psUpdate = conn.prepareStatement(UPDATE_USERS_SQL))
        {
            statement.execute(SQL_TABLE_DROP);
            statement.execute(SQL_TABLE_CREATE);
            conn.setAutoCommit(false);
            psInsert.setString(1,"Hiếu");
            psInsert.setBigDecimal(2,new BigDecimal(10));
            psInsert.setTimestamp(3,Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();
            psInsert.setString(1,"Thảo");
            psInsert.setBigDecimal(2,new BigDecimal(10));
            psInsert.setTimestamp(3,Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();

            psUpdate.setBigDecimal(1, new BigDecimal(999.99));
            psUpdate.setString(2,"Thy");
            psUpdate.execute();
            conn.commit();
            conn.setAutoCommit(true);
        }
        catch (SQLException ex){
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
    }

    @Override
    public List<User> getAllUser() {
       List<User> users = new ArrayList<>();
       String query = "{Call get_all_users}";
       try(Connection connection = getConnection();
       CallableStatement callableStatement = connection.prepareCall(query);
       ResultSet rs = callableStatement.executeQuery())
       {
           while (rs.next()){
               int id = rs.getInt("id");
               String name = rs.getString("name");
               String email = rs.getString("email");
               String country = rs.getString("country");
               users.add(new User(id,name,email,country));
           }
       }catch (SQLException e){
           printSQLException(e);
       }
       return users;
    }

    @Override
    public void updateUserUseCallable(User user) {
        String query = "{Call update_user(?,?,?,?)}";
        try(Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(query);
        )
        {
            callableStatement.setInt(1,user.getId());
            callableStatement.setString(2,user.getName());
            callableStatement.setString(3,user.getEmail());
            callableStatement.setString(4,user.getCountry());
            callableStatement.executeUpdate();
        }catch (SQLException e){
            printSQLException(e);
        }
    }

    @Override
    public void deleteUserUseCallable(int id) {
        String query ="{Call delete_user(?)}";
        try(Connection connection = getConnection();
        CallableStatement callableStatement= connection.prepareCall(query))
        {
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        }catch (SQLException e){
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}

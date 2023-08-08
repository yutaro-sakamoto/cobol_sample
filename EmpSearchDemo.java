import jp.osscons.opensourcecobol.libcobj.ui.*;

public class EmpSearchDemo {
    public static void main(String[] args) throws Exception {
        EMPREAD prog = new EMPREAD();
        CobolResultSet rs = prog.execute("0011", "", "", 0, 0);

        System.out.println("*** Employee Search from Java ***");
        System.out.println("Code      : " + rs.getString(1));
        System.out.println("Name      : " + rs.getString(2));
        System.out.println("Dept code : " + rs.getString(3));
        System.out.println("Enter date: " + rs.getInt(4));
    }
}

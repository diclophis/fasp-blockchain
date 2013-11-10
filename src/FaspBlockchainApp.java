import com.asperasoft.cmdclient.CmdClient;
import com.asperasoft.cmdclient.CmdReply;

public class FaspBlockchainApp {
    public static void main(String args[]) {
        CmdReply rpy 		= null;
        CmdClient client 	= null;

        try {
            client = new CmdClient();
            client.setConnectionTimeout(10000);
            System.out.println("Connecting to demo...");
            client.connect("hack1.aspera.us", "xfer", "aspera", 22);

            if (client.isConnected()) {
                System.out.println("Connected...");
                rpy = client.execInfo();

                if ((null != rpy))
                    rpy.printReply();

                rpy = client.execLs("btc");

                if ((null != rpy))
                    rpy.printReply();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            System.out.println("Disconnecting client");
            if ((null != client) && (client.isConnected()))
            client.disconnect();
        }
    }
}

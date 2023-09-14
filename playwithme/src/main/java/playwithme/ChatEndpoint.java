
//package playwithme;
//
//import javax.websocket.OnClose;
//import javax.websocket.OnMessage;
//import javax.websocket.OnOpen;
//import javax.websocket.Session;
//import javax.websocket.server.ServerEndpoint;
//import java.io.IOException;
//import java.util.concurrent.CopyOnWriteArrayList;
//
//@ServerEndpoint("/chat")
//public class ChatEndpoint {
//
//    private static CopyOnWriteArrayList<Session> chatClients = new CopyOnWriteArrayList<>();
//
//    @OnOpen
//    public void onOpen(Session session) {
//    	// 클라이언트 연결 시 실행할 코드
//        chatClients.add(session);
//    }
//
//    @OnMessage
//    public void onMessage(String message, Session session) {
//        // 클라이언트로부터 메시지를 받았을 때 실행되는 코드
//        for (Session client : chatClients) {
//            try {
//                client.getBasicRemote().sendText(message);
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//    }
//
//    @OnClose
//    public void onClose(Session session) {
//    	// 클라이언트 연결이 종료될 때 실행할 코드
//        chatClients.remove(session);
//    }
//}


/*
 * 작성자: 박기원
 * 목적 : 채팅방 서버
 */

package playwithme.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import playwithme.model.ChatDAO;
import playwithme.model.ChatDTO;

import java.io.Console;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

@ServerEndpoint("/chat/{room}")
public class ChatEndpoint {
    private static Map<String, CopyOnWriteArrayList<Session>> chatRooms = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("room") String room) {
        // 클라이언트 연결 시 실행할 코드
        chatRooms.computeIfAbsent(room, k -> new CopyOnWriteArrayList<>()).add(session);
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("room") String room) {
        // 클라이언트로부터 메시지를 받았을 때 실행되는 코드
        for (Session client : chatRooms.getOrDefault(room, new CopyOnWriteArrayList<>())) {
            try {
               //메시지 보내기
                client.getBasicRemote().sendText(message); 

                
                //DB
               // ChatDAO chatDatabase = new ChatDAO();
               // chatDatabase.saveMessage(message, "<%=memberId%>",room);
                
                System.out.println(message+"check");
                System.out.println(room);
                //System.out.println(session.);
                //DB
                Gson g=new Gson();
                ChatDTO chatMessage=g.fromJson(message, ChatDTO.class);
                //ChatDTO chatMessage = new ChatDTO();
                chatMessage.setRoom(room);

                ChatDAO chatDatabase = new ChatDAO();
                chatDatabase.saveMessage(chatMessage);
                
                
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @OnClose
    public void onClose(Session session, @PathParam("room") String room) {
        // 클라이언트 연결이 종료될 때 실행할 코드
        chatRooms.getOrDefault(room, new CopyOnWriteArrayList<>()).remove(session);
    }
}
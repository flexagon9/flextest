public class SessionController {
		// get session id
    @AuraEnabled
    public static String getSessionId() {
        return UserInfo.getSessionId();
    }
    
}
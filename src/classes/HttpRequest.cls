/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the http request class
 * @date 2019-09-07
 */
public class HttpRequest {

    /**
     * The http method
     *
     * @param String method
     */ 
    private String method;

    /**
     * The response headers
     *
     * @param Map<String, String>
     */ 
    private Map<String, String> headers;

    /**
     * The response body
     * 
     * @param String data
     */ 
    protected String data;

    /**
     * HttpRequest default constructor
     */
    public HttpRequest() {}

    /**
     * Creates a HttpRequest from RestRequest
     *
     * @param RestRequest request
     * @return HttpRequest
     */
    public static HttpRequest fromContext(RestRequest request) {

        return new RestRequest();
    }
}

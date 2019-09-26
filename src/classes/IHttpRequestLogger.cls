/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the contract for logging http requests.
 * @date 2019-09-06
 */
public interface IHttpRequestLogger {
    
    /**
     * handles logging of http request and response
     * 
     * @param HttpRequest request
     * @param HttpResponse response
     * @return 
     */
    void log(HttpRequest request, HttpResponse response);
}

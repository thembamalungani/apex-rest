/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for handling inbound http methods
 * @date 2019-09-06
 */
public interface IHttpMethodHandler {
    
    /**
     * Handles a HttpRequest request
     *
     * @param HttpRequest request 
     * @return HttpResponse
     */
    HttpResponse handle(HttpRequest request);

    /**
     * Called when the request is done processing
     *
     * @param HttpRequest request
     * @param HttpResponse response
     */
    void complete(HttpRequest request, HttpResponse response);

    /**
     * Called when the request failed processing
     *
     * @param HttpRequest request
     * @param HttpResponse response
     */
    void fail(HttpRequest request, HttpResponse response);
}
